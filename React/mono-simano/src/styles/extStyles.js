import styled from 'styled-components';

const Title = styled.h1`
  text-align: center;
  font-weight:lighter;
`;

const Centered = styled.div`
    text-align:center;
`;
const SmallBox = styled.div`
    position: absolute;
    top:0;
    left: 35%;
    z-index: 10;
    width: 30%;
    padding: auto;
    margin: auto;
`;

export {
    Title,
    Centered,
    SmallBox
}