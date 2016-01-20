#!/usr/bin/env python3

from glob import glob
import fileinput
import os
import sys
from re import sub
from urllib.parse import urljoin

source_dir = '../'
prefix = './'

# Matches: '==Blabla==' but not '==*Blabla>=='
classregex = r'==(?<!\*)(?P<class>\w+)(?: (?P<classside>class))?(?!>)=='
methodregex = r'==(?P<class>\w+)(?: (?P<classside>class))?>>(?P<method>(?:\w+):?(?:(?:(?:\w+):)*))=='

def class_paths(classname, types=('class','trait')):
    """ Returns the class or trait path """
    global source_dir
    matchpattern = source_dir + '*.package/' + classname + '.*'
    return [ ct for ct in glob(matchpattern) if ct.endswith(types) ]

def class_path(classname):
    results = class_paths(classname)
    if not results:
        return classname
    return results[0]

def add_prefix(path):
    return urljoin(prefix, path)

def link_class_without_code(matchobj):
    """ Return the link to a class or trait, but no code block surounding it. """
    classname = matchobj.group('class')
    classpath = class_path(classname)
    if classpath == classname:
        return classname
    classreadme = add_prefix(classpath) + '/README.md'
    return '*' + classname + '>' + classreadme  + '*'

def link_class(matchobj):
    """ Return the link to a class or trait """
    return '==' + link_class_without_code(matchobj) + '=='

def link_method(matchobj):
    """ Returns the link to a method in markdown format. """
    classname = matchobj.group('class')
    classside = matchobj.group('classside')
    class_instance_side = classside or 'instance'
    classside = classside or ''
    if classside.endswith('class'):
        classside = ' ' + classside

    methoddef = matchobj.group('method')

    methodwords = methoddef.split(':')
    filename = '.'.join(methodwords) + '.st'

    classlink = link_class_without_code(matchobj)

    classpaths = class_paths(classname, types=('class','trait','extension'))
    methodpaths = [path + '/' + class_instance_side + '/' + filename for path in classpaths]
    methodpath = next((path for path in methodpaths if os.path.isfile(path)), None)
    if not methodpath:
        if classpaths:
            fileinput.close()
            print('Classes found but method ' + methoddef + ' not found, linking failed!')
            sys.exit(1)
        methodlink = methoddef
    else:
        methodlink = '*' + methoddef + '>' + add_prefix(methodpath) + '*'

    link = '==' + classlink + classside + '====>>====' + methodlink + '=='
    return link

import argparse
parser = argparse.ArgumentParser(description='Link to classes and methods inside Pillar-formatted documentation files.')
parser.add_argument('docfiles', metavar='<path>', nargs='*', help='The documentation files to be converted. Default is all Pillar files in parent directory.')
parser.add_argument('--source-directory', metavar='<path>', help='The location of the source files to search for classes and methods.')
parser.add_argument('--prefix', '-p', metavar='<path or url>', help='What to prefix the links with, for example an URL.')
parser.add_argument('--config', '-c', metavar='<path>', help='Config file which specifies the options. Options on commandline take precedence.')

def read_config(config_path):
    import configparser
    import json
    global source_dir, prefix
    config = configparser.ConfigParser()
    config.read(config_path)
    if 'options' in config:
        prefix = config.get('options','prefix',fallback=None)
        source_dir = config.get('options','source-directory',fallback=None)
        docfiles = config.get('options','docfiles',fallback='null')
        docfiles = json.loads(docfiles)
    return docfiles

def main():
    global source_dir, prefix

    args = parser.parse_args()
    config_path = args.config
    docfiles = None
    if config_path:
        docfiles = read_config(config_path)

    source_dir = args.source_directory or source_dir
    docfiles = args.docfiles or docfiles
    prefix = args.prefix or prefix
    if not docfiles:
        docfiles = glob('../*.pillar')
    if not source_dir.endswith('/'):
        source_dir = source_dir + '/'
    if not prefix.endswith('/'):
        prefix = prefix + '/'

    print('Linking within these files:         ' + str(docfiles))
    print('Searching in this source directory: ' + source_dir)
    print('Prefixing link targets with:        ' + prefix)

    f = fileinput.input(files=docfiles, inplace=True, backup='.bak')
    for line in f:
        line = sub(classregex, link_class, line)
        line = sub(methodregex, link_method, line)
        print(line, end="", flush=True)
    f.close()

if __name__ == "__main__":
    main()
