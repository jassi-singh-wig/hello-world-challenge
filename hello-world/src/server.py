import logging
from flask import Flask, redirect, url_for
app = Flask(__name__)

logger = logging.getLogger('werkzeug')
handler = logging.FileHandler('./logs/hw-app.log')
logger.addHandler(handler)

@app.route("/")
def hello():
   return "Hello World!"

@app.route('/admin')
def hello_admin():
   return "Hello Admin!"

@app.route('/guest/<guest>')
def hello_guest(guest):
   return "Hello %s as Guest" % guest

@app.route('/user/<name>')
def hello_user(name):
   if name =='admin':
      return redirect(url_for('hello_admin'))
   else:
      return redirect(url_for('hello_guest',guest = name))
