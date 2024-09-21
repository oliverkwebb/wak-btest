#!/usr/bin/env bash

awk=gawk

if ! command -v $awk &> /dev/null
then
    echo "$awk could not be found"
    exit 1
fi

usage() {
    echo 'cull_reports -- filter awk test reports'
    echo   'Usage: cull_reports.sh orig_report_dir filtered_report_dir'
    echo   'orig_report_dir must exist; filtered_report_dir must not already exist'
    exit 1
}

if [ $# -ne 2 ];
then
    usage
fi
outdir=$1
rptdir=$2
if ! [ -e $outdir ];
then
    echo $outdir does not exist
    usage
fi
if [ -e $rptdir ];
then
    echo $rptdir already exists
    usage
fi

mkdir $rptdir

for i in p t gawk_in gawk_inok misctests mytests newtests beebe_only r allfail_in allfail_inok allpass_in allpass_inok gawkonly_in gawkonly_inok ; do
    $awk -f cull_reports.awk $outdir/$i/out $rptdir
done
