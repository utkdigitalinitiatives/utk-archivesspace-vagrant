# UTK ArchivesSpace Vagrant VM #

## About ##
This is a development/testing sandbox for ArchivesSpace. See the [official ArchivesSpace documentation](https://github.com/archivesspace/archivesspace) for additional information.



# UTK Replicator Python code

Python scripts that will replicate an ArchiveSpace instance

UTK Replicator Python code utilizes the ArchivesSpace API to copy all assets from one ArchiveSpace instance to another.

## Requirements

*   Python (written for and tested on 3.?).
*   ConfigParser
*   Requests module

## Installation

Download [Python](https://www.python.org/downloads/)

Install requirements ([ConfigParser instructions](https://docs.python.org/3/library/configparser.html) /  [Requests instructions](http://docs.python-requests.org/en/master/user/install/))

## Setup

Run `setup.py` to create a configuration file named `local_settings.cfg` which will allow you to connect to your ArchivesSpace instance. You will need:
* BaseURL of your ArchivesSpace instance
* Repository ID for your ArchivesSpace installation
* ArchivesSpace username and password

Your configuration file will look something like this:
```
[ArchivesSpace]
baseURL: #BaseURL of your ArchivesSpace instance
repository: #Repository ID of your ArchivesSpace installation
user: #ArchivesSpace username
password: #ArchivesSpace password for the username used above

[Destinations]
directory: #Directory where you would like to save the csv file
filename: dacs_singlelevel_report.csv
```
