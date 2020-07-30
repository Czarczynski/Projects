import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Card from "./card/Card";
import CardHeader from "./card/CardHeader";
import { CardMedia } from "@material-ui/core";
import CardFooter from "./card/CardFooter";
import { Centered } from "../styles/extStyles";
import { Link } from "react-router-dom";

const useStyles = makeStyles((theme) => ({
  root: {
    maxWidth: 345,
    width: 345,
    margin: 10,
  },
  media: {
    height: 0,
    paddingTop: "56.25%", // 16:9
    backgroundImage: (prp) => 'url("/assets/' + prp.image + '")',
    backgroundSize: "cover",
  },
  expand: {
    transform: "rotate(0deg)",
    marginLeft: "auto",
    transition: theme.transitions.create("transform", {
      duration: theme.transitions.duration.shortest,
    }),
  },
  expandOpen: {
    transform: "rotate(180deg)",
  },
}));

export default function CategoryItem(props) {
  const { category, photoPath, events } = props.data;
  const prop = {
    image: photoPath,
  };
  const classes = useStyles(prop);
  return (
    <Link
      to={{
        pathname: "/events?category=" + category,
        data: { events, category },
      }}
    >
      <Card className={classes.root}>
        <CardMedia className={classes.media} title="Event img" />
        <CardFooter />
        <CardHeader>
          <Centered>{category}</Centered>
        </CardHeader>
      </Card>
    </Link>
  );
}
