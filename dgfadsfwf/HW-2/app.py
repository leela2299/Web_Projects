from flask import Flask, redirect,url_for,render_template,request,session,flash
from datetime import timedelta
from flask_sqlalchemy import SQLAlchemy
import pandas as pd
from sklearn.linear_model import LinearRegression
import joblib


app = Flask(__name__)
app.secret_key = "hello!"

def load(age,weight):
    clf = joblib.load("regr.pkl")
    x = pd.DataFrame([[age, weight]], columns=["Age", "Weight"])
    prediction = clf.predict(x)[0]
    return prediction


@app.route("/",methods=["POST","GET"])
def home():
	values = []
	if request.method == "POST":
		age = request.form["age"]
		age = int(age)
		weight = request.form["weight"]
		weight = int(weight)
		values.append(load(age,weight))
	

	return render_template("index.html",l=values)


if __name__ == "__main__":
	
	app.run(debug=True)

