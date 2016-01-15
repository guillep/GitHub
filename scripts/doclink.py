#!/usr/bin/env python3

from glob import glob
import fileinput
import os
from re import sub

# Matches: `Blabla class` but not [`Blabla class`].
classregex = r'(?<!\[)`(?P<class>\w+)(?: (?P<classside>class))?`(?!\])'
methodregex = r'`(?P<class>\w+)(?: (?P<classside>class))?>>(?P<method>(?:\w+):?(?:(?:(?:\w+):)*))`'

def class_paths(classname, types=('class','trait')):
    """ Returns the class path """
    matchpattern = '../*/' + classname + '.*'
    return [ ct for ct in glob(matchpattern) if ct.endswith(types) ]

def class_path(classname):
    results = class_paths(classname)
    if not results:
        return classname
    return results[0]

def link_class(matchobj):
    """ Return the link to a class """
    classname = matchobj.group('class')
    classpath = class_path(classname)
    if classpath == classname:
        return '`' + classname + '`'
    classreadme = classpath + '/README.md'
    return '[`' + classname + '`](' + classreadme  + ')'

def link_method(matchobj):
    """ Returns the link to a method in markdown format. """
    classname = matchobj.group('class')
    classside = matchobj.group('classside') or 'instance'
    methoddef = matchobj.group('method')

    methodwords = methoddef.split(':')
    filename = '.'.join(methodwords) + '.st'

    classlink = link_class(matchobj)

    classpaths = class_paths(classname, types=('class','trait','extension'))
    methodpaths = [path + '/' + classside + '/' + filename for path in classpaths]
    methodpath = next((path for path in methodpaths if os.path.isfile(path)), None)
    if not methodpath:
        return classlink + '`>>' + methoddef + '`'

    methodlink = '[`' + methoddef + '`](' + methodpath + ')'

    link = classlink + '`>>`' + methodlink
    return link

def main():
    import sys
    docfiles = sys.argv[1:]
    if not docfiles:
        docfiles = glob('../docs/*.md')
    print(docfiles)
    f = fileinput.input(files=docfiles, inplace=True, backup='.bak')
    for line in f:
        line = sub(classregex, link_class, line)
        line = sub(methodregex, link_method, line)
        print(line, end="", flush=True)
    f.close()

if __name__ == "__main__":
    main()
