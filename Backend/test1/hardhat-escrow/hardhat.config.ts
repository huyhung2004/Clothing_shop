import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    ganache: {
      url: "http://127.0.0.1:7545",
      chainId: 5777,
      // Nếu cần chỉ định tài khoản, bạn có thể thêm:
      // accounts: ["0xYOUR_PRIVATE_KEY"]
    },
  },
};

export default config;
