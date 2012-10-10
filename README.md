# Wally client

## Installation

* ```gem install wally-client```
* Create a wally.yml file in the directory you will be running wally-client from.

     e.g.	
     # url of wally server
     url: http://localhost:4567

## Usage

	Tasks:
	  wally-client add_project NAME     # Add project
	  wally-client help [TASK]          # Describe available tasks or one specifi...
	  wally-client push PROJECT DIR     # Push features from DIR to PROJECT
	  wally-client remove_project NAME  # Remove project