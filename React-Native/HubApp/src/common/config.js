export const BG_COLOR = '#f0f5f2';
// export const BG_COLOR = '#f0f5f2';
export const MAIN_COLOR = '#61806f';
export const SMOKE_WHITE = '#F5F5F5';
export const TEXT_COLOR = '#3f525e';
export const ERROR_RED = '#b3413b';
// export const API_PREFIX = 'http://192.168.1.16:8000';
export const API_PREFIX = 'http://hub.bazych.pl';
export const CAR_CHOICES = Array(
  {label: 'Skoda Superb', value: 'Skoda Superb'},
  {label: 'Skoda Octavia', value: 'Skoda Octavia'},
);
export const FUEL_AND_GAS = Array(
  {value: '1/4'},
  {value: '2/4'},
  {value: '3/4'},
  {value: '4/4'},
);
export const LightTheme = {
  dark: false,
  colors: {
    primary: MAIN_COLOR,
    background: BG_COLOR,
    card: SMOKE_WHITE,
    text: TEXT_COLOR,
    border: 'rgb(199, 199, 204)',
    notification: '#b3413b',
  },
};

export const DarkTheme = {
  dark: true,
  colors: {
    primary: BG_COLOR,
    background: MAIN_COLOR,
    card: TEXT_COLOR,
    text: SMOKE_WHITE,
    border: 'rgb(199, 199, 204)',
    notification: '#b3413b',
  },
};
