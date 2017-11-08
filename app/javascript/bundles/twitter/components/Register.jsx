import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import AppBar from 'material-ui/AppBar';
import RaisedButton from 'material-ui/RaisedButton';
import axios from 'axios';
import React from 'react';
import { ValidatorForm } from 'react-form-validator-core';
import { TextValidator} from 'react-material-ui-form-validator';
import PropTypes from 'prop-types';

class Register extends React.Component{
    constructor(props) {
	super(props);
	this.state = {
	    formData: {
		username: '',
		email: '',
		password: '',
		confirmPassword: ''
	    }
	};

	this.handleChange = this.handleChange.bind(this);
	this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleChange(event) {
	const { formData } = this.state;
	formData[event.target.name] = event.target.value;
	this.setState({ formData });
    }

    handleSubmit(event) {
	//TODO remove hardcoded values setup prod and local configs
	var apiBaseUrl = "https://glacial-ravine-58535.herokuapp.com";
	var payload={
	   "name":this.state.formData.username,
	   "email":this.state.formData.email,
           "password":this.state.formData.password,
	   "confirm-password": this.state.formData.confirmPassword
	};
	axios.post(apiBaseUrl+'/user', payload).then(function (response) {
	    console.log(response);
	    if(response.data.status === 200) {
		localStorage.setItem("user_id", response.data.user.id)
		window.location = "https://glacial-ravine-58535.herokuapp.com"
	    }
	    else{
		alert("Could not register, Please try again.");
	    }
	}).catch(function (error) {
	    console.log(error);
	});
  }

    render() {
	const {formData} = this.state;
	return(
	    <div>
	      <MuiThemeProvider>
		<div>
		  <AppBar title="Register"/>
		  <div style={{textAlign: 'center'}}>
		    
		    <ValidatorForm
		      ref="form"
                      onSubmit={this.handleSubmit}>

		      <TextValidator
			style={style}
			name= "username"
			onChange={this.handleChange}
			validators={['required']}
			hintText="Enter Your Username"
			errorMessages={['this field is required']}
			floatingLabelText="Username"
			value={formData.username}/>

		      <br/>

		      <TextValidator
			style={style}
			name= "email"
			onChange={this.handleChange}
			validators={['required', 'isEmail']}
			hintText="Enter Your Email"
			errorMessages={['this field is required', 'This is not a proper email']}
			floatingLabelText="Email"
			value={formData.email} />

		      <br/>

		      <TextValidator
			style={style}
			name= "password"
			onChange={this.handleChange}
			validators={['required']}
			type="password"
			hintText="Enter Your Password"
			errorMessages={['this field is required']}
			floatingLabelText="Password"
			value={formData.password}/>

		       <br/>

		      <TextValidator
			style={style}
			name= "confirmPassword"
			onChange={this.handleChange}
			validators={['required']}
			type="password"
			hintText="Enter Your Password Again"
			errorMessages={['this field is required']}
			floatingLabelText="Confirm Password"
			value={formData.confirmPassword}/>

			<br/>
			<br/>

		      <RaisedButton
			style={style}
			type="submit"
			name="button"
			label="Submit"
			primary={true}/>

		    </ValidatorForm>
		  </div>
		</div>
	      </MuiThemeProvider>
	    </div>
	);
    }

}

const style = {
    width: '30%'
};

export default Register;
