ledger-journal -- A web app for keeping a journal for ledger-cli
================================================================
## Description

Ledger-journal is a simple app for keeping a journal for the ledger-cli app. Designed to be accessible from anywhere on the internet, you can use this app to update your journal from any smart phone with a good browser.

It's possible to output all your info in a text format which can be read by ledger-cli which can be used with curl or wget.

## Features
* Upload your existing ledger file
* View your ledger as text
* Edit individual entries
* Copy an existing entry (Coming Soon)
* Search entries (Coming Soon)

## Installing on Heroku
Download and install the app on heroku
	git clone git://github.com/kertap/ledger-journal
	cd ledger-journal
	heroku create
	git push heroku