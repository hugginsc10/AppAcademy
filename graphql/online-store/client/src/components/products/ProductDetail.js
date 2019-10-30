import React from "react";
import { Query } from "react-apollo";
import { Link } from "react-router-dom";

import Queries from "../../graphql/queries";
const { FETCH_PRODUCT } = Queries;

class ProductDetail extends React.Component {
  // constructor(props){
  //   super(props)
  // }
  
  render() {
    return (
      <Query query={FETCH_PRODUCT} variables={{ id: this.props.match.params.id }}>
        {({ loading, error, data }) => {
          if (loading) return "Loading...";
          if (error) return `Error! ${error.message}`;

          return (
            <div>
              <Link to="/">Products Index</Link>
              <div>
                <p key={data.product._id}>{data.product.name}&nbsp;-&nbsp;{data.product.description}&nbsp;-&nbsp;{data.product.weight} lbs.</p>
              </div>
            </div>
          );
        }}
      </Query>
    );
  };
}
export default ProductDetail;