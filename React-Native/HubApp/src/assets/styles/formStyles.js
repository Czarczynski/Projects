import {Dimensions, StyleSheet} from 'react-native';
import {
  BG_COLOR,
  ERROR_RED,
  MAIN_COLOR,
  SMOKE_WHITE,
} from '../../common/config';

export default StyleSheet.create({
  container: {
    justifyContent: 'space-between',
    flex: 1,
    backgroundColor: BG_COLOR,
    padding: 30,
  },
  logo: {alignItems: 'center'},
  image: {
    height: Dimensions.get('window').width - 200,
    width: Dimensions.get('window').width - 60,
    tintColor: MAIN_COLOR,
  },
  title: {
    alignItems: 'center',
    paddingTop: 40,
  },
  titleText: {
    fontSize: 40,
    letterSpacing: 10,
    color: MAIN_COLOR,
  },
  form: {paddingHorizontal: 30, paddingBottom: 10},
  field: {
    fontSize: 17,
    paddingBottom: 8,
    color: MAIN_COLOR,
    fontWeight: '500',
  },
  item: {
    marginVertical: 10,
    paddingHorizontal: 20,
    paddingVertical: 10,
    borderRadius: 30,
    backgroundColor: SMOKE_WHITE,
    shadowOffset: {
      width: 0,
      height: 5,
    },
    shadowOpacity: 0.27,
    shadowRadius: 10.65,
  },
  input: {
    flex: 1,
    height: Dimensions.get('window').height * 0.04,
    paddingLeft: 10,
    borderRadius: 30,
    borderColor: MAIN_COLOR,
    fontSize: 18,
  },
  button: {
    marginVertical: 10,
    paddingVertical: 8,
    backgroundColor: MAIN_COLOR,
    borderRadius: 30,
  },
  button2: {
    marginHorizontal: 50,
    borderRadius: 30,
  },
  error: {
    color: ERROR_RED,
  },
});
