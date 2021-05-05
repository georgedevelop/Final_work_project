import React from "react"
import PropTypes from "prop-types"
import flatpickr from "flatpickr";



class PartItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      description: "",
      values: [{name: "", description: "", quantity: 1, rate: 1}],
      total: 1
    };
    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleContentChange = this.handleContentChange.bind(this);
  }

  createUI(){
     return this.state.values.map((el, i) => 
     	 <React.Fragment key={i}>
         	<tr>
              		<td>
				        <input
				          type="text"
				          name={`part_order[part_items_attributes][${i}][name]`}
				          className="form-control"
				          value={el.name || ""}
				          data-title="name"
                  data-behavior="autocomplete-parts-name"
				          onChange={this.handleChange.bind(this, i)}
				        />
				    </td>
				    <td>
				        <input
				          type="text"
				          name={`part_order[part_items_attributes][${i}][description]`}
				          className="form-control"
				          value={el.description || ""}
				          data-title="description"
				          onChange={this.handleChange.bind(this, i)}
				        />
				    </td>
				    <td>
				        <input
				          type="number"
				          name={`part_order[part_items_attributes][${i}][quantity]`}
				          className="form-control"
				          value={el.quantity || ""}
				          data-title="quantity"
				          onChange={this.handleChange.bind(this, i)}
				        />
				    </td>
				    <td>
				        <input
				          type="number"
				          name={`part_order[part_items_attributes][${i}][rate]`}
				          className="form-control"
				          value={el.rate || ""}
				          data-title="rate"
				          onChange={this.handleChange.bind(this, i)}
				        />
				    </td>
				    <td>
				    	<input type='button' value='remove' onClick={this.removeClick.bind(this, i)}/>
				    </td>
				</tr>
         </React.Fragment>         
     )
  }



  handleChange(i, event) {
     let values = [...this.state.values];
     console.log(values)
     console.log(event.target.getAttribute("data-title"))
     values[i][event.target.getAttribute("data-title")] = event.target.value;
     var total = values.reduce((sum, i) => (
      sum += i.quantity * i.rate
      ), 0)
     console.log(total);
     this.setState({ values, total });
  }

  handleTitleChange(e) {
    this.setState({ title: e.target.value });
  }

  handleContentChange(e) {
    this.setState({ content: e.target.value });
  }

  addClick(){
    this.setState(prevState => ({ values: [...prevState.values, {quantity: 0, rate: 1}]}))
  }

  removeClick(i){
     let values = [...this.state.values];
     values.splice(i,1);
     var total = values.reduce((sum, i) => (
      sum += i.quantity * i.rate
      ), 0)
     this.setState({ values, total });
  }

  render() {
    return (
      <div>
      	<table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>Part Name</th>
                  <th>Part description</th>
                  <th>Quantity</th>
                  <th>Rate</th>
                  <th></th>
                </tr>
              </thead>
              <tbody class="line_items">
				{this.createUI()}  
			   </tbody>
			</table>
			      
          	<input type='button' value='Add part' onClick={this.addClick.bind(this)}/>
			<h5>Order Information</h5>
	        <div className="form-group row">
	          <label for="Delivery" className="col-sm-2 col-form-label">Total</label>
	          <div class="col-sm-2">
	            <input
		          type="text"
		          name="part_order[total]"
		          className="form-control"
		          value={this.state.total}
		          onChange={this.handleContentChange}
		          readOnly
		        />
	          </div>
	        </div>
      </div>
    );
  }
}



export default PartItem



