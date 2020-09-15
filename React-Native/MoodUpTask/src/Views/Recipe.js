import React, {Component} from 'react';
import {
  Text,
  SafeAreaView,
  StyleSheet,
  Image,
  Dimensions,
  View,
  Alert,
} from 'react-native';
import CameraRoll from '@react-native-community/cameraroll';
import RNFetchBlob from 'rn-fetch-blob';
import PropTypes from 'prop-types';

import {connect} from 'react-redux';
import {getRecipes} from '../actions/recipes';
import GLOBAL from '../actions/global';

import Snackbar from 'react-native-snackbar';
import {ScrollView, TouchableOpacity} from 'react-native-gesture-handler';

export class Recipe extends Component {
  static propTypes = {
    recipes: PropTypes.any.isRequired,
    loading: PropTypes.bool,
  };

  componentDidMount() {
    this.props.getRecipes();
  }
  saveImage = async (img) => {
    Alert.alert(
      'Do you want to save the picture?',
      '',
      [
        {
          text: 'Save',
          style: 'primary',
          onPress: () =>
            RNFetchBlob.config({
              fileCache: true,
              appendExt: 'png',
            })
              .fetch('GET', img)
              .then((res) => {
                CameraRoll.save(res.data, 'photo')
                  .then(() =>
                    Snackbar.show({
                      text: 'Photo has been saved',
                      textColor: 'green',
                    }),
                  )
                  .catch(() =>
                    Snackbar.show({
                      text: 'Something went wrong',
                      textColor: 'red',
                    }),
                  );
              })
              .catch((error) => console.log(error)),
        },
        {
          text: 'Cancel',
          style: 'cancel',
          onPress: () => {},
        },
      ],
      {cancelable: false},
    );
  };

  render() {
    const {
      title,
      description,
      ingredients,
      preparing,
      imgs,
    } = this.props.recipes;
    const {facebook} = GLOBAL;
    if (this.props.loading || this.props.loading === undefined) {
      return (
        <ScrollView style={styles.container}>
          <Text>is Loading</Text>
        </ScrollView>
      );
    }
    return (
      <SafeAreaView style={styles.container}>
        <ScrollView style={styles.scrollView}>
          <>
            <Text style={styles.bold}>{title}:</Text>
            <Text style={styles.desc}>{description}</Text>
          </>
          <>
            <Text style={styles.bold}>Ingridients:</Text>
            <View style={styles.desc}>
              {ingredients.map((item, key) => (
                <Text key={key}>-{item}</Text>
              ))}
            </View>
          </>
          <>
            <Text style={styles.bold}>Preparing:</Text>
            <View style={styles.desc}>
              {preparing.map((item, key) => (
                <Text key={key} style={styles.step}>
                  {key + 1 + '. ' + item}
                </Text>
              ))}
            </View>
          </>
          <>
            <Text style={styles.bold}>Images:</Text>
            <View style={styles.galery}>
              {imgs.map((img) => (
                <TouchableOpacity
                  style={styles.button}
                  key={img}
                  onLongPress={() => this.saveImage(img)}>
                  <Image name={img} style={styles.image} source={{uri: img}} />
                </TouchableOpacity>
              ))}
            </View>
          </>
        </ScrollView>
        <View style={styles.facebookInfo}>
          <Text>
            {facebook.name === undefined
              ? 'You are not logged in'
              : 'Logged as ' + facebook.name}
          </Text>
        </View>
      </SafeAreaView>
    );
  }
}

const styles = StyleSheet.create({
  facebookInfo: {
    backgroundColor: '#ccc',
    height: 40,
    justifyContent: 'center',

    alignItems: 'center',
  },
  container: {
    width: Dimensions.get('window').width,
    paddingBottom: 20,
    flex: 1,
    backgroundColor: '#ccc',
  },
  scrollView: {
    padding: 20,
    backgroundColor: '#fff',
  },
  bold: {
    fontWeight: '700',
  },
  desc: {
    padding: 20,
  },
  step: {
    padding: 10,
  },
  button: {
    flex: 1,
    margin: 10,
  },
  image: {
    width: Dimensions.get('window').width * 0.4,
    height: Dimensions.get('window').width * 0.25,
  },
  galery: {
    flex: 2,
    display: 'flex',
    flexDirection: 'row',
    flexWrap: 'wrap',
  },
});

const mapStateToProps = (state) => ({
  recipes: state.recipes.recipes,
  loading: state.recipes.loading,
});

export default connect(mapStateToProps, {getRecipes})(Recipe);
