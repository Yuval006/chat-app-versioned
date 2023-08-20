from flask import Flask, render_template, request, redirect, url_for
import pandas as pd
import base64

app = Flask(__name__)



@app.route("/", methods=["GET", "POST"])
def homePage():
    if request.method == "GET":
        return render_template("index.html")
    if request.method == "POST":
        # Load the CSV file as a DataFrame
        users_df = pd.read_csv('users.csv')
        # Get user input from the form
        username = request.form.get("username")
        password = request.form.get("password")

        # Encode the password in Base64
        encoded_password = base64.b64encode(password.encode()).decode()

        # Check if the user already exists in the DataFrame
        if username in users_df['username'].values:
            return "Username already exists! Please choose a different username."

        # Add the new user to the DataFrame
        new_user = {'username': username, 'password': encoded_password}
        users_df = users_df.append(new_user, ignore_index=True)

        # Save the updated DataFrame to the CSV file
        users_df.to_csv('users.csv', index=False)

        return redirect("/login")


@app.route("/login", methods=["GET", "POST"])
def loginPage():
    if request.method == "GET":
        return render_template("login.html")
    if request.method == "POST":
        # Load the CSV file as a DataFrame
        users_df = pd.read_csv('users.csv')

        # Get user input from the form
        username = request.form.get("username")
        password = request.form.get("password")

        # Extract username and password from the DataFrame
        user_data = users_df[users_df['username'] == username]
        
        if user_data.empty:
            return "Invalid username. Please try again."

        stored_encoded_password = user_data.iloc[0]['password']

        # Decode the stored Base64-encoded password
        stored_password = base64.b64decode(stored_encoded_password.encode()).decode('utf-8')

        # Compare the decoded password with the provided password
        if password == stored_password and username == user_data.iloc[0]['username']:
            return "Login completed successfully!"
        else:
            return "Invalid password. Please try again."

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")







