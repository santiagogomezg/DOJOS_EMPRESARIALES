import React,{Component} from 'react';

var LiItem = React.createClass({
	render:function(){
	return(
			<div>
				<button clasName="btn btn-danger" onClick={this.props.borrar.bind(this.props.itemText,this)}>x</button>
				<label> {this.props.itemText}</label>
				<span/>
			</div>
	);
	}
});

export default LiItem;