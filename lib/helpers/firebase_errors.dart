String getErrorString(String code){
  switch (code) {
    case 'auth/app-deleted':
      return 'O banco de dados não foi localizado.';
    case 'auth/expired-action-code':
      return 'O código da ação o ou link expirou.';
    case 'auth/invalid-action-code':
      return 'O código da ação é inválido. Isso pode acontecer se o código estiver malformado ou já tiver sido usado.';
    case 'auth/user-disabled':
      return 'O usuário correspondente à credencial fornecida foi desativado.';
    case 'auth/user-not-found':
      return 'O usuário não correponde à nenhuma credencial.';
    case 'auth/weak-password':
      return 'A senha é muito fraca.';
    case 'auth/email-already-in-use':
      return 'Já existi uma conta com o endereço de email fornecido.';
    case 'auth/invalid-email':
      return 'O endereço de e-mail não é válido.';
    case 'auth/operation-not-allowed':
      return 'O tipo de conta correspondente à esta credencial, ainda não encontra-se ativada.';
    case 'auth/account-exists-with-different-credential':
      return 'E-mail já associado a outra conta.';
    case 'auth/auth-domain-config-required':
      return 'A configuração para autenticação não foi fornecida.';
    case 'auth/credential-already-in-use':
      return 'Já existe uma conta para esta credencial.';
    case 'auth/operation-not-supported-in-this-environment':
      return 'Esta operação não é suportada no ambiente que está sendo executada. Verifique se deve ser http ou https.';
    case 'auth/timeout':
      return 'Excedido o tempo de resposta. O domínio pode não estar autorizado para realizar operações.';
    case 'auth/missing-android-pkg-name':
      return 'Deve ser fornecido um nome de pacote para instalação do aplicativo Android.';
    case 'auth/missing-continue-uri':
      return 'A próxima URL deve ser fornecida na solicitação.';
    case 'auth/missing-ios-bundle-id':
      return 'Deve ser fornecido um nome de pacote para instalação do aplicativo iOS.';
    case 'auth/invalid-continue-uri':
      return 'A próxima URL fornecida na solicitação é inválida.';
    case 'auth/unauthorized-continue-uri':
      return 'O domínio da próxima URL não está na lista de autorizações.';
    case 'auth/invalid-dynamic-link-domain':
      return 'O domínio de link dinâmico fornecido, não está autorizado ou configurado no projeto atual.';
    case 'auth/argument-error':
      return 'Verifique a configuração de link para o aplicativo.';
    case 'auth/invalid-persistence-type':
      return 'O tipo especificado para a persistência dos dados é inválido.';
    case 'auth/unsupported-persistence-type':
      return 'O ambiente atual não suportar o tipo especificado para persistência dos dados.';
    case 'auth/invalid-credential':
      return 'A credencial expirou ou está mal formada.';
    case 'auth/wrong-password':
      return 'Senha incorreta.';
    case 'auth/invalid-verification-code':
      return 'O código de verificação da credencial não é válido.';
    case 'auth/invalid-verification-id':
      return 'O ID de verificação da credencial não é válido.';
    case 'auth/custom-token-mismatch':
      return 'O token está diferente do padrão solicitado.';
    case 'auth/invalid-custom-token':
      return 'O token fornecido não é válido.';
    case 'auth/captcha-check-failed':
      return 'O token de resposta do reCAPTCHA não é válido, expirou ou o domínio não é permitido.';
    case 'auth/invalid-phone-number':
      return 'O número de telefone está em um formato inválido (padrão E.164).';
    case 'auth/missing-phone-number':
      return 'O número de telefone é requerido.';
    case 'auth/quota-exceeded':
      return 'A cota de SMS foi excedida.';
    case 'auth/cancelled-popup-request':
      return 'Somente uma solicitação de janela pop-up é permitida de uma só vez.';
    case 'auth/popup-blocked':
      return 'A janela pop-up foi bloqueado pelo navegador.';
    case 'auth/popup-closed-by-user':
      return 'A janela pop-up foi fechada pelo usuário sem concluir o login no provedor.';
    case 'auth/unauthorized-domain':
      return 'O domínio do aplicativo não está autorizado para realizar operações.';
    case 'auth/invalid-user-token':
      return 'O usuário atual não foi identificado.';
    case 'auth/user-token-expired':
      return 'O token do usuário atual expirou.';
    case 'auth/null-user':
      return 'O usuário atual é nulo.';
    case 'auth/app-not-authorized':
      return 'Aplicação não autorizada para autenticar com a chave informada.';
    case 'auth/invalid-api-key':
      return 'A chave da API fornecida é inválida.';
    case 'auth/network-request-failed':
      return 'Falha de conexão com a rede.';
    case 'auth/requires-recent-login':
      return 'O último horário de acesso do usuário não atende ao limite de segurança.';
    case 'auth/too-many-requests':
      return 'As solicitações foram bloqueadas devido a atividades incomuns. Tente novamente depois que algum tempo.';
    case 'auth/web-storage-unsupported':
      return 'O navegador não suporta armazenamento ou se o usuário desativou este recurso.';
    case 'auth/invalid-claims':
      return 'Os atributos de cadastro personalizado são inválidos.';
    case 'auth/claims-too-large':
      return 'O tamanho da requisição excede o tamanho máximo permitido de 1 Megabyte.';
    case 'auth/id-token-expired':
      return 'O token informado expirou.';
    case 'auth/id-token-revoked':
      return 'O token informado perdeu a validade.';
    case 'auth/invalid-argument':
      return 'Um argumento inválido foi fornecido a um método.';
    case 'auth/invalid-creation-time':
      return 'O horário da criação precisa ser uma data UTC válida.';
    case 'auth/invalid-disabled-field':
      return 'A propriedade para usuário desabilitado é inválida.';
    case 'auth/invalid-display-name':
      return 'O nome do usuário é inválido.';
    case 'auth/invalid-email-verified':
      return 'O e-mail é inválido.';
    case 'auth/invalid-hash-algorithm':
      return 'O algoritmo de HASH não é uma criptografia compatível.';
    case 'auth/invalid-hash-block-size':
      return 'O tamanho do bloco de HASH não é válido.';
    case 'auth/invalid-hash-derived-key-length':
      return 'O tamanho da chave derivada do HASH não é válido.';
    case 'auth/invalid-hash-key':
      return 'A chave de HASH precisa ter um buffer de byte válido.';
    case 'auth/invalid-hash-memory-cost':
      return 'O custo da memória HASH não é válido.';
    case 'auth/invalid-hash-parallelization':
      return 'O carregamento em paralelo do HASH não é válido.';
    case 'auth/invalid-hash-rounds':
      return 'O arredondamento de HASH não é válido.';
    case 'auth/invalid-hash-salt-separator':
      return 'O campo do separador de SALT do algoritmo de geração de HASH precisa ser um buffer de byte válido.';
    case 'auth/invalid-id-token':
      return 'O código do token informado não é válido.';
    case 'auth/invalid-last-sign-in-time':
      return 'O último horário de login precisa ser uma data UTC válida.';
    case 'auth/invalid-page-token':
      return 'A próxima URL fornecida na solicitação é inválida.';
    case 'auth/invalid-password':
      return 'A senha é inválida, precisa ter pelo menos 6 caracteres.';
    case 'auth/invalid-password-hash':
      return 'O HASH da senha não é válida.';
    case 'auth/invalid-password-salt':
      return 'O SALT da senha não é válido.';
    case 'auth/invalid-photo-url':
      return 'A URL da foto de usuário é inválido.';
    case 'auth/invalid-provider-id':
      return 'O identificador de provedor não é compatível.';
    case 'auth/invalid-session-cookie-duration':
      return 'A duração do COOKIE da sessão precisa ser um número válido em milissegundos, entre 5 minutos e 2 semanas.';
    case 'auth/invalid-uid':
      return 'O identificador fornecido deve ter no máximo 128 caracteres.';
    case 'auth/invalid-user-import':
      return 'O registro do usuário a ser importado não é válido.';
    case 'auth/invalid-provider-data':
      return 'O provedor de dados não é válido.';
    case 'auth/maximum-user-count-exceeded':
      return 'O número máximo permitido de usuários a serem importados foi excedido.';
    case 'auth/missing-hash-algorithm':
      return 'É necessário fornecer o algoritmo de geração de HASH e seus parâmetros para importar usuários.';
    case 'auth/missing-uid':
      return 'Um identificador é necessário para a operação atual.';
    case 'auth/reserved-claims':
      return 'Uma ou mais propriedades personalizadas fornecidas usaram palavras reservadas.';
    case 'auth/session-cookie-revoked':
      return 'O COOKIE da sessão perdeu a validade.';
    case 'auth/uid-alread-exists':
      return 'O indentificador fornecido já está em uso.';
    case 'auth/email-already-exists':
      return 'O e-mail fornecido já está em uso.';
    case 'auth/phone-number-already-exists':
      return 'O telefone fornecido já está em uso.';
    case 'auth/project-not-found':
      return 'Nenhum projeto foi encontrado.';
    case 'auth/insufficient-permission':
      return 'A credencial utilizada não tem permissão para acessar o recurso solicitado.';
    case 'auth/internal-error':
      return 'O servidor de autenticação encontrou um erro inesperado ao tentar processar a solicitação.';
  //
    case 'auth/invalid-oauth-responsetype':
      return 'Apenas um responseType do OAuth deve ser definido como verdadeiro.';
    case 'auth/missing-oauth-client-secret':
      return 'A chave secreta do cliente de configuração do OAuth é necessária para ativar o fluxo de código do OIDC.';
    case 'auth/session-cookie-expired':
      return 'O cookie da sessão do Firebase fornecido expirou.';
    case 'auth/uid-already-exists':
      return 'O uid fornecido já está sendo usado por um usuário existente. É necessário que cada usuário tenha um uid exclusivo.';
  //
    case 'app-deleted':
      return 'O banco de dados não foi localizado.';
    case 'expired-action-code':
      return 'O código da ação o ou link expirou.';
    case 'invalid-action-code':
      return 'O código da ação é inválido. Isso pode acontecer se o código estiver malformado ou já tiver sido usado.';
    case 'user-disabled':
      return 'O usuário correspondente à credencial fornecida foi desativado.';
    case 'user-not-found':
      return 'O usuário não correponde à nenhuma credencial.';
    case 'weak-password':
      return 'A senha é muito fraca.';
    case 'email-already-in-use':
      return 'Já existi uma conta com o endereço de email fornecido.';
    case 'invalid-email':
      return 'O endereço de e-mail não é válido.';
    case 'operation-not-allowed':
      return 'O tipo de conta correspondente à esta credencial, ainda não encontra-se ativada.';
    case 'account-exists-with-different-credential':
      return 'E-mail já associado a outra conta.';
    case 'auth-domain-config-required':
      return 'A configuração para autenticação não foi fornecida.';
    case 'credential-already-in-use':
      return 'Já existe uma conta para esta credencial.';
    case 'operation-not-supported-in-this-environment':
      return 'Esta operação não é suportada no ambiente que está sendo executada. Verifique se deve ser http ou https.';
    case 'timeout':
      return 'Excedido o tempo de resposta. O domínio pode não estar autorizado para realizar operações.';
    case 'missing-android-pkg-name':
      return 'Deve ser fornecido um nome de pacote para instalação do aplicativo Android.';
    case 'missing-continue-uri':
      return 'A próxima URL deve ser fornecida na solicitação.';
    case 'missing-ios-bundle-id':
      return 'Deve ser fornecido um nome de pacote para instalação do aplicativo iOS.';
    case 'invalid-continue-uri':
      return 'A próxima URL fornecida na solicitação é inválida.';
    case 'unauthorized-continue-uri':
      return 'O domínio da próxima URL não está na lista de autorizações.';
    case 'invalid-dynamic-link-domain':
      return 'O domínio de link dinâmico fornecido, não está autorizado ou configurado no projeto atual.';
    case 'argument-error':
      return 'Verifique a configuração de link para o aplicativo.';
    case 'invalid-persistence-type':
      return 'O tipo especificado para a persistência dos dados é inválido.';
    case 'unsupported-persistence-type':
      return 'O ambiente atual não suportar o tipo especificado para persistência dos dados.';
    case 'invalid-credential':
      return 'A credencial expirou ou está mal formada.';
    case 'wrong-password':
      return 'Senha incorreta.';
    case 'invalid-verification-code':
      return 'O código de verificação da credencial não é válido.';
    case 'invalid-verification-id':
      return 'O ID de verificação da credencial não é válido.';
    case 'custom-token-mismatch':
      return 'O token está diferente do padrão solicitado.';
    case 'invalid-custom-token':
      return 'O token fornecido não é válido.';
    case 'captcha-check-failed':
      return 'O token de resposta do reCAPTCHA não é válido, expirou ou o domínio não é permitido.';
    case 'invalid-phone-number':
      return 'O número de telefone está em um formato inválido (padrão E.164).';
    case 'missing-phone-number':
      return 'O número de telefone é requerido.';
    case 'quota-exceeded':
      return 'A cota de SMS foi excedida.';
    case 'cancelled-popup-request':
      return 'Somente uma solicitação de janela pop-up é permitida de uma só vez.';
    case 'popup-blocked':
      return 'A janela pop-up foi bloqueado pelo navegador.';
    case 'popup-closed-by-user':
      return 'A janela pop-up foi fechada pelo usuário sem concluir o login no provedor.';
    case 'unauthorized-domain':
      return 'O domínio do aplicativo não está autorizado para realizar operações.';
    case 'invalid-user-token':
      return 'O usuário atual não foi identificado.';
    case 'user-token-expired':
      return 'O token do usuário atual expirou.';
    case 'null-user':
      return 'O usuário atual é nulo.';
    case 'app-not-authorized':
      return 'Aplicação não autorizada para autenticar com a chave informada.';
    case 'invalid-api-key':
      return 'A chave da API fornecida é inválida.';
    case 'network-request-failed':
      return 'Falha de conexão com a rede.';
    case 'requires-recent-login':
      return 'O último horário de acesso do usuário não atende ao limite de segurança.';
    case 'too-many-requests':
      return 'As solicitações foram bloqueadas devido a atividades incomuns. Tente novamente depois que algum tempo.';
    case 'web-storage-unsupported':
      return 'O navegador não suporta armazenamento ou se o usuário desativou este recurso.';
    case 'invalid-claims':
      return 'Os atributos de cadastro personalizado são inválidos.';
    case 'claims-too-large':
      return 'O tamanho da requisição excede o tamanho máximo permitido de 1 Megabyte.';
    case 'id-token-expired':
      return 'O token informado expirou.';
    case 'id-token-revoked':
      return 'O token informado perdeu a validade.';
    case 'invalid-argument':
      return 'Um argumento inválido foi fornecido a um método.';
    case 'invalid-creation-time':
      return 'O horário da criação precisa ser uma data UTC válida.';
    case 'invalid-disabled-field':
      return 'A propriedade para usuário desabilitado é inválida.';
    case 'invalid-display-name':
      return 'O nome do usuário é inválido.';
    case 'invalid-email-verified':
      return 'O e-mail é inválido.';
    case 'invalid-hash-algorithm':
      return 'O algoritmo de HASH não é uma criptografia compatível.';
    case 'invalid-hash-block-size':
      return 'O tamanho do bloco de HASH não é válido.';
    case 'invalid-hash-derived-key-length':
      return 'O tamanho da chave derivada do HASH não é válido.';
    case 'invalid-hash-key':
      return 'A chave de HASH precisa ter um buffer de byte válido.';
    case 'invalid-hash-memory-cost':
      return 'O custo da memória HASH não é válido.';
    case 'invalid-hash-parallelization':
      return 'O carregamento em paralelo do HASH não é válido.';
    case 'invalid-hash-rounds':
      return 'O arredondamento de HASH não é válido.';
    case 'invalid-hash-salt-separator':
      return 'O campo do separador de SALT do algoritmo de geração de HASH precisa ser um buffer de byte válido.';
    case 'invalid-id-token':
      return 'O código do token informado não é válido.';
    case 'invalid-last-sign-in-time':
      return 'O último horário de login precisa ser uma data UTC válida.';
    case 'invalid-page-token':
      return 'A próxima URL fornecida na solicitação é inválida.';
    case 'invalid-password':
      return 'A senha é inválida, precisa ter pelo menos 6 caracteres.';
    case 'invalid-password-hash':
      return 'O HASH da senha não é válida.';
    case 'invalid-password-salt':
      return 'O SALT da senha não é válido.';
    case 'invalid-photo-url':
      return 'A URL da foto de usuário é inválido.';
    case 'invalid-provider-id':
      return 'O identificador de provedor não é compatível.';
    case 'invalid-session-cookie-duration':
      return 'A duração do COOKIE da sessão precisa ser um número válido em milissegundos, entre 5 minutos e 2 semanas.';
    case 'invalid-uid':
      return 'O identificador fornecido deve ter no máximo 128 caracteres.';
    case 'invalid-user-import':
      return 'O registro do usuário a ser importado não é válido.';
    case 'invalid-provider-data':
      return 'O provedor de dados não é válido.';
    case 'maximum-user-count-exceeded':
      return 'O número máximo permitido de usuários a serem importados foi excedido.';
    case 'missing-hash-algorithm':
      return 'É necessário fornecer o algoritmo de geração de HASH e seus parâmetros para importar usuários.';
    case 'missing-uid':
      return 'Um identificador é necessário para a operação atual.';
    case 'reserved-claims':
      return 'Uma ou mais propriedades personalizadas fornecidas usaram palavras reservadas.';
    case 'session-cookie-revoked':
      return 'O COOKIE da sessão perdeu a validade.';
    case 'uid-alread-exists':
      return 'O indentificador fornecido já está em uso.';
    case 'email-already-exists':
      return 'O e-mail fornecido já está em uso.';
    case 'phone-number-already-exists':
      return 'O telefone fornecido já está em uso.';
    case 'project-not-found':
      return 'Nenhum projeto foi encontrado.';
    case 'insufficient-permission':
      return 'A credencial utilizada não tem permissão para acessar o recurso solicitado.';
    case 'internal-error':
      return 'O servidor de autenticação encontrou um erro inesperado ao tentar processar a solicitação.';
    case 'invalid-oauth-responsetype':
      return 'Apenas um responseType do OAuth deve ser definido como verdadeiro.';
    case 'missing-oauth-client-secret':
      return 'A chave secreta do cliente de configuração do OAuth é necessária para ativar o fluxo de código do OIDC.';
    case 'session-cookie-expired':
      return 'O cookie da sessão do Firebase fornecido expirou.';
    case 'uid-already-exists':
      return 'O uid fornecido já está sendo usado por um usuário existente. É necessário que cada usuário tenha um uid exclusivo.';
  //
    case 'ABORTED':
      return 'Indica que a solicitação entrou em conflito com outra solicitação.';
    case 'ALREADY_EXISTS':
      return 'Indica que a solicitação tentou inserir uma entidade que já existe.';
    case 'DEADLINE_EXCEEDED':
      return 'Um prazo excedeu no servidor.';
    case 'FAILED_PRECONDITION':
      return 'Indica que uma condição prévia para a solicitação não foi atendida. O campo de mensagem na resposta de erro fornece informações sobre essa condição. Uma possível causa é a execução de uma consulta que requer um índice ainda não definido.';
    case 'INTERNAL':
      return 'O servidor retornou um erro.';
    case 'INVALID_ARGUMENT':
      return 'Indica que um parâmetro de solicitação tem um valor inválido. O campo de mensagem na resposta de erro fornece informações sobre o valor inválido.';
    case 'NOT_FOUND':
      return 'Indica que a solicitação tentou atualizar uma entidade que não existe.';
    case 'PERMISSION_DENIED':
      return 'Indica que o usuário não foi autorizado a fazer a solicitação.';
    case 'RESOURCE_EXHAUSTED':
      return 'Indica que o projeto excedeu sua cota ou a capacidade da região/multirregião.';
    case 'UNAUTHENTICATED':
      return 'Indica que a solicitação não tinha credenciais de autenticação válidas.';
    case 'UNAVAILABLE':
      return 'O servidor retornou um erro.';
  //
    case 'ERROR_WEAK_PASSWORD':
      return 'Sua senha é muito fraca.';
    case 'ERROR_INVALID_EMAIL':
      return 'Seu e-mail é inválido.';
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return 'E-mail já está sendo utilizado em outra conta.';
    case 'ERROR_INVALID_CREDENTIAL':
      return 'Seu e-mail é inválido.';
    case 'ERROR_WRONG_PASSWORD':
      return 'Sua senha está incorreta.';
    case 'ERROR_USER_NOT_FOUND':
      return 'Não há usuário com este e-mail.';
    case 'ERROR_USER_DISABLED':
      return 'Este usuário foi desabilitado.';
    case 'ERROR_TOO_MANY_REQUESTS':
      return 'Muitas solicitações. Tente novamente mais tarde.';
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return 'Operação não permitida.';

    default:
      return 'Um erro indefinido ocorreu.';
  }
}