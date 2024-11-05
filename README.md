# Forge-Scripting
# Proyecto Bank - Foundry

Este proyecto es una implementación de un contrato bancario simple que permite a los usuarios depositar y retirar ETH. Las pruebas están diseñadas con **Foundry** e incluyen fuzz testing para asegurar que se verifiquen los límites y escenarios inesperados.

## Utilidad de las Pruebas Fuzz

Las pruebas fuzz permiten realizar pruebas con entradas aleatorias para garantizar que el contrato se comporte correctamente bajo una amplia gama de escenarios. Esto es útil para descubrir vulnerabilidades que no se encuentran fácilmente con pruebas determinísticas.

### Configuración de las Pruebas Fuzz

Las pruebas fuzz se configuran automáticamente en **Foundry** usando la función `vm.assume` para filtrar casos no válidos. Las pruebas se ejecutan con una variedad de valores para asegurar la estabilidad del contrato bajo diferentes condiciones.

### Scripts de Implementación

Se han creado scripts de implementación en Solidity para diferentes redes. La clase `NetworkManager.s.sol` permite gestionar el despliegue en diferentes redes, como Goerli y Mumbai, utilizando las variables de entorno.

### Despliegue

Para desplegar el contrato en una red específica, puedes ejecutar el siguiente comando:

```bash
forge script script/NetworkManager.s.sol --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast
