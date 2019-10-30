import React from "react";
// import React, { Component } from "react";
// import gql from "graphql-tag";
import { Query } from "react-apollo";
import { Link } from "react-router-dom"

import Queries from "../../graphql/queries";
const { FETCH_PRODUCTS } = Queries;

const ProductIndex = () => {
  return (
    <Query query={FETCH_PRODUCTS}>
      {({ loading, error, data }) => {
        if (loading) return "Loading...";
        if (error) return `Error! ${error.message}`;

        return (
          <ul>
            {data.products.map(product => (
              <Link key={product._id} to={`/products/${product._id}`}>
                <li>{product.name}</li>
              </ Link>
            ))}
          </ul>
        );
      }}
    </Query>
  );
};

export default ProductIndex;
