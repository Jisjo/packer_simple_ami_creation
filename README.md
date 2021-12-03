# Create Amazon Machine Image (AMI) using Packer
![This is an image](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4ncu8ADr4QDb4oE31AqYwKdgoqemRAQahQ6D3nHL9fN6MRc1333xh8ZY0mcoQJUa2giU&usqp=CAU)


Packer is a lightweight, open source tool for building machine images across multiple platforms, including AWS, Azure, and GCP.
Objective

   + Write a HCL file to be used with Packer (ami.pkr.hcl)
   + Create a bash script to install the required softwares (git.sh)
   + Run Packer to create our AMI

## Prerequisites

   + AWS Access Key and Secret Key
   + Select an existing AMI on Amazon to use as your base image to change
   + Install Packer

## Usage

   + Install Git
   + Clone the repo
   
```
git clone https://github.com/BetcyBabu/packer.git
cd packer
packer build ami.pkr.hcl
```
This creates a new EC2 instanced based on source_ami, install softwares, stops the instance, creates an AMI based on the new instance, and then terminates the EC2 instance.

## Result


```hcl

jisjo@jisjo-mypc ~ # packer build main.pkr.hcl 
linux-AMI-builder.amazon-ebs.httpd-webserver: output will be in this color.

==> linux-AMI-builder.amazon-ebs.httpd-webserver: Prevalidating any provided VPC information
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Prevalidating AMI Name: PACKER-DEMO-httpd-webserver
    linux-AMI-builder.amazon-ebs.httpd-webserver: Found Image ID: ami-052cef05d01020f1d
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Creating temporary keypair: packer_61a9c24c-0ea8-82c3-9130-ce23eab977ea
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Creating temporary security group for this instance: packer_61a9c251-9dec-8671-da25-10310459b355
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Authorizing access to port 22 from [0.0.0.0/0] in the temporary security groups...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Launching a source AWS instance...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Adding tags to source instance
    linux-AMI-builder.amazon-ebs.httpd-webserver: Adding tag: "Name": "Packer Builder"
    linux-AMI-builder.amazon-ebs.httpd-webserver: Instance ID: i-078465acbb535149c
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Waiting for instance (i-078465acbb535149c) to become ready...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Using SSH communicator to connect: 13.232.178.203
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Waiting for SSH to become available...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Connected to SSH!
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Provisioning with shell script: script.sh
    linux-AMI-builder.amazon-ebs.httpd-webserver: Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Existing lock /var/run/yum.pid: another copy is running as pid 3180.
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Another app is currently holding the yum lock; waiting for it to exit...
==> linux-AMI-builder.amazon-ebs.httpd-webserver:   The other application is: yum
==> linux-AMI-builder.amazon-ebs.httpd-webserver:     Memory :  79 M RSS (372 MB VSZ)
==> linux-AMI-builder.amazon-ebs.httpd-webserver:     Started: Fri Dec  3 07:08:36 2021 - 00:05 ago
==> linux-AMI-builder.amazon-ebs.httpd-webserver:     State  : Running, pid: 3180
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Another app is currently holding the yum lock; waiting for it to exit...
==> linux-AMI-builder.amazon-ebs.httpd-webserver:   The other application is: yum
==> linux-AMI-builder.amazon-ebs.httpd-webserver:     Memory :  84 M RSS (377 MB VSZ)
==> linux-AMI-builder.amazon-ebs.httpd-webserver:     Started: Fri Dec  3 07:08:36 2021 - 00:07 ago
==> linux-AMI-builder.amazon-ebs.httpd-webserver:     State  : Running, pid: 3180
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Another app is currently holding the yum lock; waiting for it to exit...
==> linux-AMI-builder.amazon-ebs.httpd-webserver:   The other application is: yum
==> linux-AMI-builder.amazon-ebs.httpd-webserver:     Memory : 156 M RSS (449 MB VSZ)
==> linux-AMI-builder.amazon-ebs.httpd-webserver:     Started: Fri Dec  3 07:08:36 2021 - 00:09 ago
==> linux-AMI-builder.amazon-ebs.httpd-webserver:     State  : Running, pid: 3180
    linux-AMI-builder.amazon-ebs.httpd-webserver: Resolving Dependencies
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Running transaction check
    linux-AMI-builder.amazon-ebs.httpd-webserver: ---> Package httpd.x86_64 0:2.4.51-1.amzn2 will be installed
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Processing Dependency: httpd-tools = 2.4.51-1.amzn2 for package: httpd-2.4.51-1.amzn2.x86_64
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Processing Dependency: httpd-filesystem = 2.4.51-1.amzn2 for package: httpd-2.4.51-1.amzn2.x86_64
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Processing Dependency: system-logos-httpd for package: httpd-2.4.51-1.amzn2.x86_64
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Processing Dependency: mod_http2 for package: httpd-2.4.51-1.amzn2.x86_64
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Processing Dependency: httpd-filesystem for package: httpd-2.4.51-1.amzn2.x86_64
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Processing Dependency: /etc/mime.types for package: httpd-2.4.51-1.amzn2.x86_64
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Processing Dependency: libaprutil-1.so.0()(64bit) for package: httpd-2.4.51-1.amzn2.x86_64
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Processing Dependency: libapr-1.so.0()(64bit) for package: httpd-2.4.51-1.amzn2.x86_64
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Running transaction check
    linux-AMI-builder.amazon-ebs.httpd-webserver: ---> Package apr.x86_64 0:1.7.0-9.amzn2 will be installed
    linux-AMI-builder.amazon-ebs.httpd-webserver: ---> Package apr-util.x86_64 0:1.6.1-5.amzn2.0.2 will be installed
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Processing Dependency: apr-util-bdb(x86-64) = 1.6.1-5.amzn2.0.2 for package: apr-util-1.6.1-5.amzn2.0.2.x86_64
    linux-AMI-builder.amazon-ebs.httpd-webserver: ---> Package generic-logos-httpd.noarch 0:18.0.0-4.amzn2 will be installed
    linux-AMI-builder.amazon-ebs.httpd-webserver: ---> Package httpd-filesystem.noarch 0:2.4.51-1.amzn2 will be installed
    linux-AMI-builder.amazon-ebs.httpd-webserver: ---> Package httpd-tools.x86_64 0:2.4.51-1.amzn2 will be installed
    linux-AMI-builder.amazon-ebs.httpd-webserver: ---> Package mailcap.noarch 0:2.1.41-2.amzn2 will be installed
    linux-AMI-builder.amazon-ebs.httpd-webserver: ---> Package mod_http2.x86_64 0:1.15.19-1.amzn2.0.1 will be installed
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Running transaction check
    linux-AMI-builder.amazon-ebs.httpd-webserver: ---> Package apr-util-bdb.x86_64 0:1.6.1-5.amzn2.0.2 will be installed
    linux-AMI-builder.amazon-ebs.httpd-webserver: --> Finished Dependency Resolution
    linux-AMI-builder.amazon-ebs.httpd-webserver:
    linux-AMI-builder.amazon-ebs.httpd-webserver: Dependencies Resolved
    linux-AMI-builder.amazon-ebs.httpd-webserver:
    linux-AMI-builder.amazon-ebs.httpd-webserver: ================================================================================
    linux-AMI-builder.amazon-ebs.httpd-webserver:  Package                Arch      Version                   Repository     Size
    linux-AMI-builder.amazon-ebs.httpd-webserver: ================================================================================
    linux-AMI-builder.amazon-ebs.httpd-webserver: Installing:
    linux-AMI-builder.amazon-ebs.httpd-webserver:  httpd                  x86_64    2.4.51-1.amzn2            amzn2-core    1.3 M
    linux-AMI-builder.amazon-ebs.httpd-webserver: Installing for dependencies:
    linux-AMI-builder.amazon-ebs.httpd-webserver:  apr                    x86_64    1.7.0-9.amzn2             amzn2-core    122 k
    linux-AMI-builder.amazon-ebs.httpd-webserver:  apr-util               x86_64    1.6.1-5.amzn2.0.2         amzn2-core     99 k
    linux-AMI-builder.amazon-ebs.httpd-webserver:  apr-util-bdb           x86_64    1.6.1-5.amzn2.0.2         amzn2-core     19 k
    linux-AMI-builder.amazon-ebs.httpd-webserver:  generic-logos-httpd    noarch    18.0.0-4.amzn2            amzn2-core     19 k
    linux-AMI-builder.amazon-ebs.httpd-webserver:  httpd-filesystem       noarch    2.4.51-1.amzn2            amzn2-core     24 k
    linux-AMI-builder.amazon-ebs.httpd-webserver:  httpd-tools            x86_64    2.4.51-1.amzn2            amzn2-core     88 k
    linux-AMI-builder.amazon-ebs.httpd-webserver:  mailcap                noarch    2.1.41-2.amzn2            amzn2-core     31 k
    linux-AMI-builder.amazon-ebs.httpd-webserver:  mod_http2              x86_64    1.15.19-1.amzn2.0.1       amzn2-core    149 k
    linux-AMI-builder.amazon-ebs.httpd-webserver:
    linux-AMI-builder.amazon-ebs.httpd-webserver: Transaction Summary
    linux-AMI-builder.amazon-ebs.httpd-webserver: ================================================================================
    linux-AMI-builder.amazon-ebs.httpd-webserver: Install  1 Package (+8 Dependent packages)
    linux-AMI-builder.amazon-ebs.httpd-webserver:
    linux-AMI-builder.amazon-ebs.httpd-webserver: Total download size: 1.9 M
    linux-AMI-builder.amazon-ebs.httpd-webserver: Installed size: 5.2 M
    linux-AMI-builder.amazon-ebs.httpd-webserver: Downloading packages:
    linux-AMI-builder.amazon-ebs.httpd-webserver: --------------------------------------------------------------------------------
    linux-AMI-builder.amazon-ebs.httpd-webserver: Total                                              9.9 MB/s | 1.9 MB  00:00
    linux-AMI-builder.amazon-ebs.httpd-webserver: Running transaction check
    linux-AMI-builder.amazon-ebs.httpd-webserver: Running transaction test
    linux-AMI-builder.amazon-ebs.httpd-webserver: Transaction test succeeded
    linux-AMI-builder.amazon-ebs.httpd-webserver: Running transaction
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Installing : apr-1.7.0-9.amzn2.x86_64                                     1/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Installing : apr-util-bdb-1.6.1-5.amzn2.0.2.x86_64                        2/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Installing : apr-util-1.6.1-5.amzn2.0.2.x86_64                            3/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Installing : httpd-tools-2.4.51-1.amzn2.x86_64                            4/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Installing : generic-logos-httpd-18.0.0-4.amzn2.noarch                    5/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Installing : mailcap-2.1.41-2.amzn2.noarch                                6/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Installing : httpd-filesystem-2.4.51-1.amzn2.noarch                       7/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Installing : mod_http2-1.15.19-1.amzn2.0.1.x86_64                         8/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Installing : httpd-2.4.51-1.amzn2.x86_64                                  9/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Verifying  : apr-util-1.6.1-5.amzn2.0.2.x86_64                            1/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Verifying  : httpd-2.4.51-1.amzn2.x86_64                                  2/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Verifying  : apr-util-bdb-1.6.1-5.amzn2.0.2.x86_64                        3/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Verifying  : httpd-filesystem-2.4.51-1.amzn2.noarch                       4/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Verifying  : apr-1.7.0-9.amzn2.x86_64                                     5/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Verifying  : mailcap-2.1.41-2.amzn2.noarch                                6/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Verifying  : generic-logos-httpd-18.0.0-4.amzn2.noarch                    7/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Verifying  : mod_http2-1.15.19-1.amzn2.0.1.x86_64                         8/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:   Verifying  : httpd-tools-2.4.51-1.amzn2.x86_64                            9/9
    linux-AMI-builder.amazon-ebs.httpd-webserver:
    linux-AMI-builder.amazon-ebs.httpd-webserver: Installed:
    linux-AMI-builder.amazon-ebs.httpd-webserver:   httpd.x86_64 0:2.4.51-1.amzn2
    linux-AMI-builder.amazon-ebs.httpd-webserver:
    linux-AMI-builder.amazon-ebs.httpd-webserver: Dependency Installed:
    linux-AMI-builder.amazon-ebs.httpd-webserver:   apr.x86_64 0:1.7.0-9.amzn2
    linux-AMI-builder.amazon-ebs.httpd-webserver:   apr-util.x86_64 0:1.6.1-5.amzn2.0.2
    linux-AMI-builder.amazon-ebs.httpd-webserver:   apr-util-bdb.x86_64 0:1.6.1-5.amzn2.0.2
    linux-AMI-builder.amazon-ebs.httpd-webserver:   generic-logos-httpd.noarch 0:18.0.0-4.amzn2
    linux-AMI-builder.amazon-ebs.httpd-webserver:   httpd-filesystem.noarch 0:2.4.51-1.amzn2
    linux-AMI-builder.amazon-ebs.httpd-webserver:   httpd-tools.x86_64 0:2.4.51-1.amzn2
    linux-AMI-builder.amazon-ebs.httpd-webserver:   mailcap.noarch 0:2.1.41-2.amzn2
    linux-AMI-builder.amazon-ebs.httpd-webserver:   mod_http2.x86_64 0:1.15.19-1.amzn2.0.1
    linux-AMI-builder.amazon-ebs.httpd-webserver:
    linux-AMI-builder.amazon-ebs.httpd-webserver: Complete!
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.
==> linux-AMI-builder.amazon-ebs.httpd-webserver: /tmp/script_9053.sh: line 5: /var/www/html/inde.html: Permission denied
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Stopping the source instance...
    linux-AMI-builder.amazon-ebs.httpd-webserver: Stopping instance
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Waiting for the instance to stop...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Creating AMI PACKER-DEMO-httpd-webserver from instance i-078465acbb535149c
    linux-AMI-builder.amazon-ebs.httpd-webserver: AMI: ami-04db41e28a4d1e30b
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Waiting for AMI to become ready...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Skipping Enable AMI deprecation...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Adding tags to AMI (ami-04db41e28a4d1e30b)...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Tagging snapshot: snap-0f23eeff389234594
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Creating AMI tags
    linux-AMI-builder.amazon-ebs.httpd-webserver: Adding tag: "Name": "PACKER-DEMO-httpd-webserver"
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Creating snapshot tags
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Terminating the source AWS instance...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Cleaning up any extra volumes...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: No volumes to clean up, skipping
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Deleting temporary security group...
==> linux-AMI-builder.amazon-ebs.httpd-webserver: Deleting temporary keypair...
Build 'linux-AMI-builder.amazon-ebs.httpd-webserver' finished after 3 minutes 24 seconds.

==> Wait completed after 3 minutes 24 seconds

==> Builds finished. The artifacts of successful builds are:
--> linux-AMI-builder.amazon-ebs.httpd-webserver: AMIs were created:
ap-south-1: ami-04db41e28a4d1e30b

```
