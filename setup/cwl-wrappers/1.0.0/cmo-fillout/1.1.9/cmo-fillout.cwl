#!/usr/bin/env cwl-runner

$namespaces:
  dct: http://purl.org/dc/terms/
  foaf: http://xmlns.com/foaf/0.1/
  doap: http://usefulinc.com/ns/doap#

$schemas:
  - http://dublincore.org/2012/06/14/dcterms.rdf
  - http://xmlns.com/foaf/spec/20140114.rdf
  - http://usefulinc.com/ns/doap#

doap:name: cmo-fillout.cwl
doap:release:
  - class: doap:Version
    doap:revision: '1.1.9'

dct:creator:
- class: foaf:Organization
  foaf:name: Memorial Sloan Kettering Cancer Center
  foaf:member:
  - class: foaf:Person
    foaf:name: Jaeyoung Chun
    foaf:mbox: mailto:chunj@mskcc.org

dct:contributor:
- class: foaf:Organization
  foaf:name: Memorial Sloan Kettering Cancer Center
  foaf:member:
  - class: foaf:Person
    foaf:name: Jaeyoung Chun
    foaf:mbox: mailto:chunj@mskcc.org

# This tool description was generated automatically by argparse2cwl ver. 0.3.1
# To generate again: $ cmo_fillout -o FILENAME --generate_cwl_tool
# Help: $ cmo_fillout  --help_arg2cwl

cwlVersion: "cwl:v1.0"

class: CommandLineTool
baseCommand: ['cmo_fillout']

requirements:
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    ramMin: 10
    coresMin: 2

doc: |
  Perform fillout operation on MAF file using GetBaseCountsMultiSample

inputs:
  
  maf:
    type: string
  
    doc: MAF file on which to filllout
    inputBinding:
      prefix: --maf 

  bams:
    type:
      type: array
      items: string
  
    doc: BAM files to fillout with
    inputBinding:
      prefix: --bams 

  genome:
    type:
      type: enum
      symbols: ['GRCm38', 'hg19', 'ncbi36', 'mm9', 'GRCh37', 'mm10', 'hg18', 'GRCh38']
    doc: Reference assembly of BAM files, e.g. hg19/grch37/b37
    inputBinding:
      prefix: --genome 

  output:
    type: ["null", string]
    doc: Prefix for output file
    inputBinding:
      prefix: --output 

  n_threads:
    type: ["null", string]
    default: 10
    doc: Multithread
    inputBinding:
      prefix: --n_threads 

  version:
    type:
    - "null"
    - type: enum
      symbols: ['1.1.9', 'default']
    doc: version of GBCMS to use to count with...
    inputBinding:
      prefix: --version 


outputs:
  recal_matrix:
    type: File
    outputBinding:
      glob: |
        ${
          if (inputs.out)
            return inputs.out;
          return null;
        }
