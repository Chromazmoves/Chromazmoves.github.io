from flask import Flask, render_template, request
app = Flask(__name__)

@app.route('/')
def student():
	return render_template('student2.html')

@app.route('/Result',methods = ['POST', 'GET'])
def result():
	if request.method == 'POST':
		income = request.form['income']
		name = request.form['name']
		
		zakat_calc = float(income) * 0.025
		zakat_calc_rounded = round(zakat_calc)

		if int(income) >= 5000:    
			return render_template("result2.html", name=name, zakat_calc_rounded=zakat_calc_rounded)
		else:
			return render_template("falserequest.html", name=name)

if __name__ == '__main__':
	app.debug=True
	app.run()
