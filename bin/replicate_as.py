#!/usr/bin/python3
# -*- coding: utf-8 -*-

import requests
import json
import sys
import os
import logging
import glob
import ConfigParser
# set this variables to match the base URL of your ArchivesSpace installation
#baseURL = 'http://albatross.lib.utk.edu:8089'
# set this variable to match the id of your repository
#repository = '3'
# archiveFolder = '/vagrant/archive'
# user = admin
# password = password


# if I were to really do this right, i would divide all this into objects but
# not enough time right now.

def post_data(configDict, object_data, object_type):
	post_response = requests.post("/repositories/"+repository+"/accessions/"+object_type, headers=headers, data=object_data).json()
	print post_response


def load_json_contents(filepath):
	if os.path.isfile(file):
		with open (file) as json_data:
			return json.load(json_data)

def get_type(json):
	type = json['jsonmodel_type']
	return type

def export_accessions (configDict):

    # Gets the IDs of all accessions in the repository
    accessionIds = requests.get(configDict['baseURL'] + "/repositories/" + configDict['repostitory'] + "/accessions?all_ids=true", headers=headers)

    # Exports EAD for all resources whose IDs contain 'FA'
    for id in accessionIds.json():
    	accession = (requests.get(configDict['baseURL'] + "/repositories/" + configDict['repostitory'] +  "/accessions/" + str(id), headers=headers)).json()
    	json_accession = json.dumps(accession)
    #	# Sets the location where the files should be saved
    	destination = configDict[archiveFolder]
    	f = open(destinatio n+ '/assession_'  + str(id) + ".json", 'a')
    	f.write(json_accession)
    	f.close
    	print (str(id) + "_accession.json exported to " + destination)

def export_resources (configDict):
    # Gets the IDs of all resources in the repository
    resourceIds = requests.get(configDict['baseURL'] + "/repositories/"+configDict['repository']+"/resources?all_ids=true", headers=configDict['headers'])

    # Exports EAD for all resources whose IDs contain 'FA'
    for id in resourceIds.json():
    	resource = (requests.get(configDict['baseURL'] + "/repositories/"+configDict['repository']+"/resources/" + str(id), headers=configDict['headers'])).json()
    	json_resource = json.dumps(resource)
    ##	ead = requests.get(baseURL + "/repositories/"+repository+"/resource_descriptions/"+str(id)+".xml", headers=headers).text
    #	# Sets the location where the files should be saved
    	archiveFolder = configDict['archiveFolder']
    	jsonFile = open(archiveFolder  + '/resource_' + str(id) +".json", 'a')
    	jsonFile.write(json_resource)
    	jsonFile.close
    	print (str(id) + ".json exported to " + archiveFolder)


def create_objects(configDict) :
    # create all the accessions in the replica repository
    archiveFolder = configDict['archiveFolder']
    for filepath in glob.glob(os.path.join('archiveFolder', '*.json')):
    	json_data = load_json_contents(filepath)
    	json_type = get_type(json_data)
    	post_data(configDict['headers'],json_data, json_type)

def main():
    config = ConfigParser.ConfigParser()
    config.read('local_settings.cfg')
    configDict = {'archiveFolder': config.get('ArchivesSpace', 'archiveFolder'), 'baseURL': config.get('ArchivesSpace', 'baseURL'), 'repository':config.get('ArchivesSpace', 'repository'), 'user': config.get('ArchivesSpace', 'user'), 'password': config.get('ArchivesSpace', 'password'), 'destination': config.get('Destinations', 'EADdestination')}

    # XXX there should be a command line argument that will limit the number of accessions and resources replicated

    # parses arguments, if any. This allows you to pass in an string to match against resource IDs

    logging.basicConfig(filename='replicate_as.log',format='%(asctime)s %(message)s', datefmt='%m/%d/%Y %I:%M:%S %p', level=logging.DEBUG)


    # authenticates the session
    auth = requests.post(baseURL + '/users/' + configDict['admin'] + '/login?password=' + configDict['password']
    authjson = auth.json()
    session = authjson["session"]
    if auth.status_code == 200:
    	print ("Authenticated!")

    configDict['headers'] = {'X-ArchivesSpace-Session':session}
    export_accessions (configDict)
    export_resources (configDict)
    create_accessions (configDict)

if __name__ == "__main__":
    main()
