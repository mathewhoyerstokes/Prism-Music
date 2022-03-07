import Web3 from 'web3';
import PrismSale from './PrismSale.json';

const web3 = new Web3(Web3.givenProvider || "ws://127.0.0.1:7545");

const contractAddress = "0x273c6bD09d950B86Adae3C523f339713BE6ef3D6" 
const contract = new web3.eth.Contract(PrismSale.abi, contractAddress)

const sharedMessage = "This is to confirm your account when downloading the limited edition album"

export { web3, contract, contractAddress, sharedMessage }
