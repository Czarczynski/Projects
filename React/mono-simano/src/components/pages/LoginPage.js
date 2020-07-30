import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import InputAdornment from "@material-ui/core/InputAdornment";

import Email from "@material-ui/icons/Email";
import Facebook from "@material-ui/icons/Facebook";
import LockOutlined from "@material-ui/icons/LockOutlined";
import Twitter from "@material-ui/icons/LinkedIn";
import Apple from "@material-ui/icons/Apple";

import GridContainer from "./../layout/GridContainer.js";
import GridItem from "./../layout/GridItem.js";
import Button from "./../Button.js";
import Card from "./../card/Card";
import CardBody from "./../card/CardBody.js";
import CardHeader from "./../card/CardHeader.js";
import CardFooter from "./../card/CardFooter.js";
import CustomInput from "./../CustomInput.js";
import styles from "../../styles/loginPageStyle";

import image from "../../images/landing-bg.jpg";

import HeaderLinks from "./../layout/HeaderLinks";
import Header from "./../layout/Header";
import Footer from "./../layout/Footer";

const useStyles = makeStyles(styles);

export default function LoginPage(props) {
  const [cardAnimaton, setCardAnimation] = React.useState("cardHidden");
  setTimeout(function () {
    setCardAnimation("");
  }, 700);
  const classes = useStyles();

  return (
    <>
      <Header
        color="transparent"
        brand="MONO SIMANO "
        rightLinks={<HeaderLinks />}
        fixed
        changeColorOnScroll={{
          height: 400,
          color: "white",
        }}
      />
      <div
        className={classes.pageHeader}
        style={{
          backgroundImage: "url(" + image + ")",
          backgroundSize: "cover",
          backgroundPosition: "top center",
        }}
      >
        <div>
          <div className={classes.container}>
            <GridContainer justify="center">
              <GridItem xs={12} sm={12} md={4}>
                <Card className={classes[cardAnimaton]}>
                  <form className={classes.form}>
                    <CardHeader color="primary" className={classes.cardHeader}>
                      <h4>Login with</h4>
                      <div className={classes.socialLine}>
                        <Button
                          justIcon
                          href="/"
                          target="_blank"
                          color="transparent"
                          onClick={(e) => e.preventDefault()}
                        >
                          <Twitter white />
                        </Button>
                        <Button
                          justIcon
                          href="/"
                          target="_blank"
                          color="transparent"
                          onClick={(e) => e.preventDefault()}
                        >
                          <Facebook white />
                        </Button>
                        <Button
                          justIcon
                          href="/"
                          target="blank"
                          color="transparent"
                          onClick={(e) => e.preventDefault()}
                        >
                          <Apple white />
                        </Button>
                      </div>
                    </CardHeader>
                    <p className={classes.divider}>Or Be Classical</p>
                    <CardBody>
                      <CustomInput
                        labelText="Email..."
                        id="email"
                        formControlProps={{
                          fullWidth: true,
                        }}
                        inputProps={{
                          type: "email",
                          endAdornment: (
                            <InputAdornment position="end">
                              <Email className={classes.inputIconsColor} />
                            </InputAdornment>
                          ),
                        }}
                      />
                      <CustomInput
                        labelText="Password"
                        id="pass"
                        formControlProps={{
                          fullWidth: true,
                        }}
                        inputProps={{
                          type: "password",
                          endAdornment: (
                            <InputAdornment position="end">
                              <LockOutlined
                                className={classes.inputIconsColor}
                              />
                            </InputAdornment>
                          ),
                          autoComplete: "off",
                        }}
                      />
                    </CardBody>
                    <CardFooter className={classes.cardFooter}>
                      <Button simple color="primary" size="lg">
                        Get started
                      </Button>
                    </CardFooter>
                  </form>
                </Card>
              </GridItem>
            </GridContainer>
          </div>
        </div>
        <Footer whiteFont />
      </div>
    </>
  );
}
