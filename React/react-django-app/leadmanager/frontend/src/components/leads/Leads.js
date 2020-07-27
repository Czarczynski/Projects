import React, { Component, Fragment } from "react";
import { connect } from "react-redux";
import PropTypes from "prop-types";
import { getLeads, deleteLead, patchLead } from "../../actions/leads";

export class Leads extends Component {
  static propTypes = {
    leads: PropTypes.array.isRequired,
    getLeads: PropTypes.func.isRequired,
    deleteLead: PropTypes.func.isRequired,
    patchLead: PropTypes.func.isRequired,
  };

  componentDidMount() {
    this.props.getLeads();
  }
  s = false;
  render() {
    if (this.props.leads.length == 0) {
      return (
        <Fragment>
          <h2 className="text-center">Nothing is here</h2>
        </Fragment>
      );
    }
    return (
      <Fragment>
        {/* FIRST TABLE */}

        {this.props.leads.filter((item) => item.active).length == 0 ? (
          ""
        ) : (
          <>
            <h2>Leads</h2>
            <table className="table col table-striped mb-5">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Message</th>
                  <th />
                  <th />
                </tr>
              </thead>
              <tbody>
                {this.props.leads
                  .filter((lead) => lead.active)
                  .sort((a, b) => (a.created_at > b.created_at ? 1 : -1))
                  .map((lead) => (
                    <tr key={lead.id}>
                      <td>{lead.name}</td>
                      <td>{lead.email}</td>
                      <td>{lead.message}</td>
                      <td>
                        {/* <button
                          onClick={this.props.patchLead.bind(this, lead.id, {
                            active: !lead.active,
                          })}
                          className="btn btn-info btn-sm"
                        >
                          {" "}
                          Active
                        </button> */}
                      </td>
                      <td>
                        <button
                          onClick={this.props.deleteLead.bind(this, lead.id)}
                          className="btn btn-danger btn-sm"
                        >
                          {" "}
                          Delete
                        </button>
                      </td>
                    </tr>
                  ))}
              </tbody>
            </table>
          </>
        )}

        {/* SECOND TABLE */}
        {this.props.leads.filter((item) => !item.active).length == 0 ? (
          ""
        ) : (
          <>
            <h2>Not Activated Leads</h2>
            <table className="table table-striped">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Message</th>
                  <th />
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {this.props.leads
                  .filter((a) => !a.active)
                  .sort((a, b) => (a.created_at > b.created_at ? 1 : -1))
                  .map((lead) => (
                    <tr key={lead.id}>
                      <td>{lead.name}</td>
                      <td>{lead.email}</td>
                      <td>{lead.message}</td>
                      <td>
                        <button
                          onClick={this.props.patchLead.bind(this, lead.id, {
                            active: !lead.active,
                          })}
                          className="btn btn-info btn-sm"
                        >
                          Active
                        </button>
                      </td>
                      <td>
                        <button
                          onClick={this.props.deleteLead.bind(this, lead.id)}
                          className="btn btn-danger btn-sm"
                        >
                          {" "}
                          Delete
                        </button>
                      </td>
                    </tr>
                  ))}
              </tbody>
            </table>
          </>
        )}
      </Fragment>
    );
  }
}

const mapStateToProps = (state) => ({
  leads: state.leads.leads,
});

export default connect(mapStateToProps, { getLeads, deleteLead, patchLead })(
  Leads,
);
