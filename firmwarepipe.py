#!/usr/bin/env python



import argparse
from os.path import relpath, join, dirname
from os import walk
import subprocess
import shlex
import collections


def parse_args():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest='cmd', title='Available sub-commands', metavar='COMMAND')

    # A list command
    mp7_parser = subparsers.add_parser('mp7', help='MP7Butler driver')
    mp7_parser.add_argument('boardid', help='MP7 board id')
    mp7_parser.add_argument('inputDir', help='Input directory')
    mp7_parser.add_argument('outputDir', help='Output directory')

    vsim_parser = subparsers.add_parser('modelsim', help='Modelsim driver')
    vsim_parser.add_argument('inputDir', help='Input directory')
    vsim_parser.add_argument('outputDir', help='Output directory')
    vsim_parser.add_argument('runtime', help='Simulation runtime for each file')
    vsim_parser.add_argument('-d', '--debug', action='store_true', help='Debug')
    vsim_parser.add_argument('-n', '--dryrun', action='store_true', help='Dry run')
    vsim_parser.add_argument('--caplen', type=int, default=None, help='Capture length')
    vsim_parser.add_argument('--capoffset', type=int, default=None, help='Capture offset')

    args = parser.parse_args()

    pathlist = []
    for root, dirs, files in walk(args.inputDir):
        for file in files:
            relroot = relpath(root, args.inputDir)
            if file.endswith('.txt'):
                pathlist.append(
                    (join(root, file), join(args.outputDir, relroot,file))
                    )

    del args.inputDir
    del args.outputDir
    arguments = vars(args)
    arguments['pathlist'] = pathlist

    return arguments

class MP7Plugin(object):
    """docstring for MP7Plugin"""
    _templConfPlayBack = 'mp7butler xbuffer {} rx PlayOnce --inject {}'
    _templConfCapture = 'mp7butler xbuffer {} tx Capture'
    _templCapture = 'mp7butler capture -o {}'

    def __init__(self, boardid, pathlist):
        super(MP7Plugin, self).__init__()
        self.boardid = boardid
        self.pathlist = pathlist

    def __call__(self):
        for ip,op in self.pathlist:

            print 'mkdir -p',dirname(op)
            print self._templConfPlayBack.format(self.boardid, ip)
            print self._templConfCapture.format(self.boardid)
            print self._templCapture.format(self.boardid)
        
class ModelsimPlugin(object):
    """docstring for MP7Plugin"""
    _templVSim = './vsim -c {} work.top -do "run {}; exit"'
    def __init__(self, pathlist, runtime, dryrun, debug, caplen, capoffset):

        super(ModelsimPlugin, self).__init__()
        self.runtime = runtime
        self.pathlist = pathlist
        self.dryrun = dryrun
        self.generics = {}
        self.generics['debug'] = ('true' if debug else 'false')
        self.generics['caplen'] = caplen
        self.generics['capoffset'] = capoffset

    def __call__(self):

        for ip,op in self.pathlist:

            genpars = collections.OrderedDict()
            genpars['sourcefile'] = ip
            genpars['sinkfile'] = op
            genpars.update({k:v for k,v in self.generics.iteritems() if v is not None})

            genstr = ' '.join(['-G{}={}'.format(k,v) for k,v in genpars.iteritems()])
            
            cmds = [
                'mkdir -p '+dirname(op),
                self._templVSim.format(genstr, self.runtime)
                ]

            for cmd in cmds:
                args = shlex.split(cmd)
                if self.dryrun:
                    args.insert(0, 'echo')                    
                subprocess.check_call(args)



if __name__ == '__main__':
    args = parse_args()

    # x0 = MP7Plugin(args['boardid'], args['pathlist'])
    cmd = args.pop('cmd')

    if cmd == 'modelsim':
        plugin = ModelsimPlugin(**args)
        plugin()
    elif cmd in ['mp7']:
        print "pipe {} not supported yet.".format(cmd)
    else:
        print "pipe {} not supported.".format(cmd)

