# pysnmp-aws-lambda-layer

AWS Lambda Layer for Python PySNMP module.

## Why SNMP?!

Because.

To be more clear: because I needed it as a cloud guy who works hard to integrate on-premises infrastructure with cloud.  And SNMP is a reasonable way for a Lambda to extract information from decades of existing on-premises infrastructure.

This is why SNMP.  :)

## Building the Layers

1. Confirm the build directory is clean.

    ``` shell
    $ ls -1 build
    build-pysnmp.sh
    ```

2. Then execute the docker `public.ecr.aws/lambda/python` images to run the build script.

    ``` shell
    docker run --rm -v `pwd`/build:/var/task -it --entrypoint /bin/bash public.ecr.aws/lambda/python:3.6 ./build-pysnmp.sh

    docker run --rm -v `pwd`/build:/var/task -it --entrypoint /bin/bash public.ecr.aws/lambda/python:3.7 ./build-pysnmp.sh

    docker run --rm -v `pwd`/build:/var/task -it --entrypoint /bin/bash public.ecr.aws/lambda/python:3.8 ./build-pysnmp.sh

    docker run --rm -v `pwd`/build:/var/task -it --entrypoint /bin/bash public.ecr.aws/lambda/python:3.9 ./build-pysnmp.sh
    ```

## Deploy the Layers

Once the layer zip files are created, you can deploy them to your AWS account with the following command:

``` shell
aws lambda publish-layer-version --layer-name "pysnmp-python36" --description "PySNMP Module for Python 3.6 Runtime" --license-info "BSD-2-Clause" --compatible-runtimes "python3.6" --zip-file "fileb://build/pysnmp-python3.6.zip"

aws lambda publish-layer-version --layer-name "pysnmp-python37" --description "PySNMP Module for Python 3.7 Runtime" --license-info "BSD-2-Clause" --compatible-runtimes "python3.7" --zip-file "fileb://build/pysnmp-python3.7.zip"

aws lambda publish-layer-version --layer-name "pysnmp-python38" --description "PySNMP Module for Python 3.8 Runtime" --license-info "BSD-2-Clause" --compatible-runtimes "python3.8" --zip-file "fileb://build/pysnmp-python3.8.zip"

aws lambda publish-layer-version --layer-name "pysnmp-python39" --description "PySNMP Module for Python 3.9 Runtime" --license-info "BSD-2-Clause" --compatible-runtimes "python3.9" --zip-file "fileb://build/pysnmp-python3.9.zip"
```
