# Installation and setup guide

## Requirements
Python 3
MySQL Server
pip

## Installation
Clone the repo:
git clone git@github.com:Millelinee/SafeBite-submission.git
cd SafeBite-submission 

Create a virtual environment:
python3 -m venv venv
source venv/bin/activate

Install dependencies:
pip install -r requirements.txt

## Setup the database
Create the database structure:
mysql -u root -p < database/schema.sql

Insert product data:
mysql -u root -p SafeBite < database/seed.sql

Create procedure and functions:
mysql -u root -p SafeBite < database/procedures_and_functions.sql

## Run the program
Start the SafeBite application:
source venv/bin/activate
python3 python/safebite.py
