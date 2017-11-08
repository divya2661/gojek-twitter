import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import AppBar from 'material-ui/AppBar';
import RaisedButton from 'material-ui/RaisedButton';
import axios from 'axios';
import React from 'react';
import { ValidatorForm } from 'react-form-validator-core';
import { TextValidator} from 'react-material-ui-form-validator';
import PropTypes from 'prop-types';

class Tweet extends React.Component{
    constructor(props) {
	super(props);
	this.state = {
	    formData: {
		tweetMessage: '',
		userId: '',
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
	//:TODO remove hardcoded values 
	var apiBaseUrl = "https://glacial-ravine-58535.herokuapp.com";

	var payload={
	    "message":this.state.formData.tweetMessage,
	    "user_id":localStorage.getItem("user_id")
	};
	
	axios.post(apiBaseUrl+'/tweet', payload).then(function (response) {
	    if(response.data.status === 200) {
		alert("Tweet Successful");
	    }
	    else{
		alert("Could not tweet, Please try again.");
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
		    <div style={{width: '50%', marginLeft: '25%'}}>
			<AppBar title="Tweet"/>
			<div style={{textAlign: 'center'}}>
			    
			    <ValidatorForm
				ref="form"
				onSubmit={this.handleSubmit}>

				<TextValidator
				style={style}
				name= "tweetMessage"
				onChange={this.handleChange}
				multiLine={true}
				validators={['required']}
				hintText="Tweet Tweet......"
				errorMessages={['this field is required']}
				floatingLabelText="Tweet"
				value={formData.tweetMessage}/>

				<br/>
				<br/>
				<br/>

				<RaisedButton
				style={style}
				type="submit"
				name="button"
				label="Tweet"
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
    width: '80%'
};

export default Tweet;
