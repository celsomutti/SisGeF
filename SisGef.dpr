program SisGef;

uses
  Vcl.Forms,
  System.SysUtils,
  udm in 'udm.pas' {dm: TDataModule},
  clContatos in 'Model\clContatos.pas',
  clEndereco in 'Model\clEndereco.pas',
  clPessoaJuridica in 'Model\clPessoaJuridica.pas',
  clAbastecimentos in 'classes\clAbastecimentos.pas',
  clAgentes in 'classes\clAgentes.pas',
  clAtribuicoes in 'classes\clAtribuicoes.pas',
  clBaixas in 'classes\clBaixas.pas',
  clBancos in 'classes\clBancos.pas',
  clCEPAgentes in 'classes\clCEPAgentes.pas',
  clLacres in 'classes\clLacres.pas',
  clContatoAgente in 'classes\clContatoAgente.pas',
  clContatoEntregador in 'classes\clContatoEntregador.pas',
  clControleKM in 'classes\clControleKM.pas',
  clEnderecoAgente in 'classes\clEnderecoAgente.pas',
  clEnderecoEntregador in 'classes\clEnderecoEntregador.pas',
  clEntrega in 'classes\clEntrega.pas',
  clEntregador in 'classes\clEntregador.pas',
  clEstados in 'classes\clEstados.pas',
  clExtrato in 'classes\clExtrato.pas',
  clExtravios in 'classes\clExtravios.pas',
  clLancamentos in 'classes\clLancamentos.pas',
  clOrdemServico in 'classes\clOrdemServico.pas',
  clPlanilhaCredito in 'classes\clPlanilhaCredito.pas',
  clRestricaoEntrega in 'classes\clRestricaoEntrega.pas',
  clRestricoes in 'classes\clRestricoes.pas',
  clServicos in 'classes\clServicos.pas',
  clServicosContratos in 'classes\clServicosContratos.pas',
  clVeiculos in 'classes\clVeiculos.pas',
  clVerbaCEP in 'classes\clVerbaCEP.pas',
  ufrmListaApoio in 'ufrmListaApoio.pas' {frmListaApoio},
  ufrmAgentesJornal in 'view\ufrmAgentesJornal.pas' {frmAgentesJornal},
  ufrmLacres in 'view\ufrmLacres.pas' {frmLacres},
  ufrmVeiculos in 'view\ufrmVeiculos.pas' {frmVeiculos},
  ufrmGrupoVerba in 'view\ufrmGrupoVerba.pas' {frmGrupoVerba},
  ufrmImportaEntrega in 'view\ufrmImportaEntrega.pas' {frmImportaEntregas},
  ufrmMalotes in 'view\ufrmMalotes.pas' {frmMalotes},
  ufrmOrdemServico in 'view\ufrmOrdemServico.pas' {frmOrdemServico},
  ufrmLocalizar in 'ufrmLocalizar.pas' {frmLocalizar},
  ufrmImportaBaixas in 'view\ufrmImportaBaixas.pas' {frmImportaBaixas},
  ufrmImportaAbastacimentos in 'view\ufrmImportaAbastacimentos.pas' {frmImportaAbastecimentos},
  Vcl.Themes,
  Vcl.Styles,
  ufrmLancamentos in 'view\ufrmLancamentos.pas' {frmLancamentos},
  ufrmControleKM in 'view\ufrmControleKM.pas' {frmControleKM},
  ufrmPrazosEntrega in 'view\ufrmPrazosEntrega.pas' {frmPrazosEntrega},
  ufrmPlanilhaCredito in 'view\ufrmPlanilhaCredito.pas' {frmPlanilhaCredito},
  ufrmTipoExportacao in 'view\ufrmTipoExportacao.pas' {frmTipoExportacao},
  clDetalheTransporte in 'classes\clDetalheTransporte.pas',
  ufrmDataGV in 'view\ufrmDataGV.pas' {frmDataGV},
  clContasReceber in 'classes\clContasReceber.pas',
  ufrmContasReceber in 'view\ufrmContasReceber.pas' {frmContasReceber},
  ufrmAutorizacao in 'ufrmAutorizacao.pas' {frmAutorizacao},
  ufrmSalvaLancamento in 'view\ufrmSalvaLancamento.pas' {frmSalvaLancamento},
  ufrmBaixaContasReceber in 'view\ufrmBaixaContasReceber.pas' {frmBaixaContaReceber},
  uthrImportarAbastecimentosJatinho in 'Thread\uthrImportarAbastecimentosJatinho.pas',
  uthrSalvarAssinantes in 'Thread\uthrSalvarAssinantes.pas',
  ufrmEmpresasAgentes in 'view\ufrmEmpresasAgentes.pas' {frmEmpresasAgentes},
  clCentroCusto in 'classes\clCentroCusto.pas',
  ufrmCentroCusto in 'view\ufrmCentroCusto.pas' {frmCentroCusto},
  ufrmEntregadoresFuncionarios in 'view\ufrmEntregadoresFuncionarios.pas' {frmEntregadoresFuncionarios},
  uthrExtratoPrevioAgente in 'Thread\uthrExtratoPrevioAgente.pas',
  ufrmAtribuicoesJornal in 'view\ufrmAtribuicoesJornal.pas' {frmAtribuicoesJornal},
  ufrmEntregadorEx in 'view\ufrmEntregadorEx.pas' {frmEntregadorEx},
  uthrImportarAero in 'Thread\uthrImportarAero.pas',
  uthrSalvaRecepcao in 'Thread\uthrSalvaRecepcao.pas',
  uthrPopulaRecepcao in 'Thread\uthrPopulaRecepcao.pas',
  ufrmRetornoEntregas in 'view\ufrmRetornoEntregas.pas' {frmRetornoEntregas},
  uthrSalvaBaixasConcluidas in 'Thread\uthrSalvaBaixasConcluidas.pas',
  uthrSalvaRetornoEntregas in 'Thread\uthrSalvaRetornoEntregas.pas',
  uthrPopulaRelatorioRetorno in 'Thread\uthrPopulaRelatorioRetorno.pas',
  clGruposVerba in 'classes\clGruposVerba.pas',
  clAcessos in 'classes\clAcessos.pas',
  ufrmCadastraSenha in 'view\ufrmCadastraSenha.pas' {frmCadastraSenha},
  ufrmGruposUsuarios in 'view\ufrmGruposUsuarios.pas' {frmGruposUsuarios},
  ufrmLogin in 'ufrmLogin.pas' {frmLogin},
  clPessoaF in 'Model\clPessoaF.pas',
  ufrmData in 'view\ufrmData.pas' {frmData},
  uthrImportarFinanceiroTFO in 'Thread\uthrImportarFinanceiroTFO.pas',
  uthrPopularAero in 'Thread\uthrPopularAero.pas',
  uthrSalvaAtribuicoesJornal in 'Thread\uthrSalvaAtribuicoesJornal.pas',
  uthrPopularAcareacoes in 'Thread\uthrPopularAcareacoes.pas',
  ufrmUsuariosAgentes in 'view\ufrmUsuariosAgentes.pas' {frmUsuariosAgentes},
  uthrPopularEntregadoresVencidos in 'Thread\uthrPopularEntregadoresVencidos.pas',
  ufrmVeiculosEx in 'view\ufrmVeiculosEx.pas' {frmVeiculosEx},
  uthrPopularLancamentosExtrato in 'Thread\uthrPopularLancamentosExtrato.pas',
  clEnvioEMail in 'classes\clEnvioEMail.pas',
  ufrmEnvioEmail in 'view\ufrmEnvioEmail.pas' {frmEnvioEmail},
  ufrmExtratoAgente in 'view\ufrmExtratoAgente.pas' {frmExtratoAgente},
  uthrExtratoFechadoAgente in 'Thread\uthrExtratoFechadoAgente.pas',
  clRelatorioDiario in 'classes\clRelatorioDiario.pas',
  ufrmPesquisaEntregadores in 'view\ufrmPesquisaEntregadores.pas' {frmPesquisaEntregadores},
  uthrPopularVeiculos in 'Thread\uthrPopularVeiculos.pas',
  clFTPSimples in 'classes\clFTPSimples.pas',
  clMalote in 'classes\clMalote.pas',
  ufrmDevolucoes in 'view\ufrmDevolucoes.pas' {frmDevolucoes},
  clBarrTFO in 'classes\clBarrTFO.pas',
  ufrmDevolucaoBase in 'view\ufrmDevolucaoBase.pas' {frmDevolucaoBase},
  ufrmRecepcaoContainers in 'view\ufrmRecepcaoContainers.pas' {frmRecepcaoContainers},
  ufrmDivergencia in 'view\ufrmDivergencia.pas' {frmDivergencia},
  clAgentesJornal in 'classes\clAgentesJornal.pas',
  ufrmServicos in 'view\ufrmServicos.pas' {frmServicos},
  ufrmRetiradaDevolucoes in 'view\ufrmRetiradaDevolucoes.pas' {frmRetiradaDevolucoes},
  Thread.ImportaBancasJones in 'Thread\Thread.ImportaBancasJones.pas',
  ufrmTipoDevolucao in 'view\ufrmTipoDevolucao.pas' {frmTipoDevolucao},
  ufrmImportarEtiquetas in 'view\ufrmImportarEtiquetas.pas' {frmImportarEtiquetas},
  uthrImportarDevolucao in 'Thread\uthrImportarDevolucao.pas',
  uthrPopularAtribuicoesJornal in 'Thread\uthrPopularAtribuicoesJornal.pas',
  ufrmEntregas in 'view\ufrmEntregas.pas' {frmEntregas},
  clUtil in 'clUtil.pas',
  uGlobais in 'uGlobais.pas',
  clUsuarios in 'classes\clUsuarios.pas',
  clDevolucoes in 'classes\clDevolucoes.pas',
  ufrmImpressao in 'view\ufrmImpressao.pas' {frmImpressao},
  clCodigosEntregadores in 'classes\clCodigosEntregadores.pas',
  ufrmRecepcaoHermes in 'view\ufrmRecepcaoHermes.pas' {frmRecepcaoHermes},
  ufrmImportarFinanceiro in 'view\ufrmImportarFinanceiro.pas' {frmImportarFinanceiro},
  uthrImportarBaixas in 'Thread\uthrImportarBaixas.pas',
  ufrmRelatorioDocumentosVencidos in 'view\ufrmRelatorioDocumentosVencidos.pas' {frmRelatorioDocumentosVencidos},
  ufrmManutencaoRestricoes in 'view\ufrmManutencaoRestricoes.pas' {frmManutencaoRestricoes},
  uthrPopularExtraviosCadastro in 'Thread\uthrPopularExtraviosCadastro.pas',
  ufrmDetalhesLancamentos in 'view\ufrmDetalhesLancamentos.pas' {frmDetalhesLancamentos},
  ufrmDebitosRestricoes in 'view\ufrmDebitosRestricoes.pas' {frmDebitosRestricoes},
  ufrmExtraviosProdutos in 'view\ufrmExtraviosProdutos.pas' {frmExtraviosProdutos},
  ufrmGravarExtravio in 'view\ufrmGravarExtravio.pas' {frmGravarExtravio},
  uthrPopularRestricoes in 'Thread\uthrPopularRestricoes.pas',
  uthrExtratoFechadoRestricoes in 'Thread\uthrExtratoFechadoRestricoes.pas',
  uthrPopularExtraviosRestricao in 'Thread\uthrPopularExtraviosRestricao.pas',
  ufrmAssinantes in 'view\ufrmAssinantes.pas' {frmAssinantes},
  clAcareacoes in 'classes\clAcareacoes.pas',
  uthrPopularExtravios in 'Thread\uthrPopularExtravios.pas',
  ufrmDetalhesRestricoes in 'view\ufrmDetalhesRestricoes.pas' {frmDetalhesRestricoes},
  uthrPopularLancamentos in 'Thread\uthrPopularLancamentos.pas',
  ufrmAbastecimentos in 'view\ufrmAbastecimentos.pas' {frmAbastecimentos},
  clTipoOcorrencias in 'classes\clTipoOcorrencias.pas',
  ufrmFiltro in 'view\ufrmFiltro.pas' {frmFiltro},
  ufrmProdutos in 'view\ufrmProdutos.pas' {frmProdutos},
  clCliente in 'classes\clCliente.pas',
  clConexao in 'classes\clConexao.pas',
  ufrmClientes in 'view\ufrmClientes.pas' {frmClientes},
  ufrmAcareacoes in 'view\ufrmAcareacoes.pas' {frmAcareacoes},
  uthrImportarExtravios in 'Thread\uthrImportarExtravios.pas',
  ufrmImportarExtravios in 'view\ufrmImportarExtravios.pas' {frmImportarExtravios},
  ufrmProcesso in 'view\ufrmProcesso.pas' {frmProcesso},
  clProdutos in 'classes\clProdutos.pas',
  uthrSalvarExtravios in 'Thread\uthrSalvarExtravios.pas',
  ufrmEtiquetasJornal in 'view\ufrmEtiquetasJornal.pas' {frmEtiquetasJornal},
  clAtribuicoesJornal in 'classes\clAtribuicoesJornal.pas',
  uthrImportarEtiquetas in 'Thread\uthrImportarEtiquetas.pas',
  uthrSalvarEtiquetas in 'Thread\uthrSalvarEtiquetas.pas',
  ufrmAtribuicoesEntregas in 'view\ufrmAtribuicoesEntregas.pas' {frmAtribuicoesEntregas},
  clAssinantes in 'classes\clAssinantes.pas',
  uthrSalvaAero in 'Thread\uthrSalvaAero.pas',
  uthrPopularEtiquetas in 'Thread\uthrPopularEtiquetas.pas',
  ufrmListaAtribuicoes in 'view\ufrmListaAtribuicoes.pas' {frmListaAtribuicoes},
  uthrSalvaAtribuicoes in 'Thread\uthrSalvaAtribuicoes.pas',
  uthrPopularAtribuicoes in 'Thread\uthrPopularAtribuicoes.pas',
  clStatus in 'classes\clStatus.pas',
  clEmpresas in 'classes\clEmpresas.pas',
  clPessoaJ in 'Model\clPessoaJ.pas',
  ufrmEmpresas in 'view\ufrmEmpresas.pas' {frmEmpresas},
  clEnderecosCadastro in 'classes\clEnderecosCadastro.pas',
  clFinanceiroEmpresa in 'classes\clFinanceiroEmpresa.pas',
  clTipoContrato in 'classes\clTipoContrato.pas',
  clEmpresaContrato in 'classes\clEmpresaContrato.pas',
  ufrmPesquisaCadastro in 'view\ufrmPesquisaCadastro.pas' {frmPesquisaCadastro},
  ufrmBaixaProtocoloJornal in 'view\ufrmBaixaProtocoloJornal.pas' {frmBaixaProtocoloJornal},
  ufrmDadosProtocolo in 'view\ufrmDadosProtocolo.pas' {frmDadosProtocolo},
  clPessoaFisica in 'Model\clPessoaFisica.pas',
  clCadastro in 'classes\clCadastro.pas',
  clEnderecosEmpresas in 'classes\clEnderecosEmpresas.pas',
  clContatosCadastro in 'classes\clContatosCadastro.pas',
  clContatosEmpresas in 'classes\clContatosEmpresas.pas',
  ufrmSegundaViaProtocolo in 'view\ufrmSegundaViaProtocolo.pas' {frmSegundaViaProtocolo},
  ufrmInformacoesProduto in 'view\ufrmInformacoesProduto.pas' {frmInformacoesProduto},
  clParametros in 'classes\clParametros.pas',
  ufrmAmbientes in 'view\ufrmAmbientes.pas' {SIS09997},
  ufrmListaObjetos in 'view\ufrmListaObjetos.pas' {frmListaObjetos},
  clOcorrenciasJornal in 'classes\clOcorrenciasJornal.pas',
  clAssinantesJornal in 'classes\clAssinantesJornal.pas',
  ActiveHandleException in 'classes\ActiveHandleException.pas',
  ufrmAssinantesJornal in 'view\ufrmAssinantesJornal.pas' {frmAssinantesJornal},
  clTipoAssinatura in 'classes\clTipoAssinatura.pas',
  ufrmPlanilhaOperacionalJornal in 'view\ufrmPlanilhaOperacionalJornal.pas' {frmPlanilhaOperacionalJornal},
  clRoteiroEntregador in 'classes\clRoteiroEntregador.pas',
  clOperacaoJornal in 'classes\clOperacaoJornal.pas',
  ufrmRoteiroEntregador in 'view\ufrmRoteiroEntregador.pas' {frmRoteiroEntregador},
  ufrmOperacaoRepositor in 'view\ufrmOperacaoRepositor.pas' {frmOperacaoRepositor},
  ufrmVisualizarRepositor in 'view\ufrmVisualizarRepositor.pas' {frmVisualizarRepositor},
  ufrmCusteioOcorrencias in 'view\ufrmCusteioOcorrencias.pas' {frmCusteioOcorrencia},
  clCusteioOcorrencias in 'classes\clCusteioOcorrencias.pas',
  ufrmConsolidadoBaseJornal in 'view\ufrmConsolidadoBaseJornal.pas' {frmConsolidadoBaseJornal},
  ufrmVerbaFaixaPeso in 'view\ufrmVerbaFaixaPeso.pas' {frmVerbaFaixaPeso},
  ufrmCepDistribuidores in 'view\ufrmCepDistribuidores.pas' {frmCepDistribuidores},
  ufrmVerbaCEP in 'view\ufrmVerbaCEP.pas' {frmVerbaCEP},
  ufrmMain in 'ufrmMain.pas' {frmMain},
  ufrmRecadosJornal in 'view\ufrmRecadosJornal.pas' {frmRecadosJornal},
  ufrmExtratoExpressa in 'view\ufrmExtratoExpressa.pas' {frmExtratoExpressa},
  uthrPopularEntregadores in 'Thread\uthrPopularEntregadores.pas',
  ufrmPesquisarPessoa in 'View\ufrmPesquisarPessoa.pas' {frmPesquisarPessoa},
  ufrmControleTransportes in 'view\ufrmControleTransportes.pas' {frmControleTransportes},
  ufrmValor in 'view\ufrmValor.pas' {frmValor},
  DAO.Connection in 'DAO\DAO.Connection.pas',
  Model.ExtratoExpressas in 'Model\Model.ExtratoExpressas.pas',
  DAO.Base in 'DAO\DAO.Base.pas',
  DAO.ConnectionFactory in 'DAO\DAO.ConnectionFactory.pas',
  DAO.ExtratoExpressas in 'DAO\DAO.ExtratoExpressas.pas',
  Model.ControleTransporte in 'Model\Model.ControleTransporte.pas',
  DAO.ControleTransporte in 'DAO\DAO.ControleTransporte.pas',
  DAO.ItensManutencao in 'DAO\DAO.ItensManutencao.pas',
  Model.ItensManutencao in 'Model\Model.ItensManutencao.pas',
  Model.EstoqueInsumos in 'Model\Model.EstoqueInsumos.pas',
  Model.ManutencaoVeiculos in 'Model\Model.ManutencaoVeiculos.pas',
  DAO.EstoqueInsumos in 'DAO\DAO.EstoqueInsumos.pas',
  DAO.ManutencaoVeiculos in 'DAO\DAO.ManutencaoVeiculos.pas',
  ufrmEstoqueInsumosTransportes in 'View\ufrmEstoqueInsumosTransportes.pas' {frmEstoqueInsumosTransportes},
  Model.InsumosTransportes in 'Model\Model.InsumosTransportes.pas',
  DAO.InsumosTransportes in 'DAO\DAO.InsumosTransportes.pas',
  Model.ConsumoInsumos in 'Model\Model.ConsumoInsumos.pas',
  DAO.ConsumoInsumos in 'DAO\DAO.ConsumoInsumos.pas',
  ufrmItensManutencao in 'View\ufrmItensManutencao.pas' {frmItensManutencao},
  ufrmInsumosTransporte in 'View\ufrmInsumosTransporte.pas' {frmInsumosTransporte},
  ufrmManutencaoVeiculos in 'View\ufrmManutencaoVeiculos.pas' {frmManutencaoVeiculos},
  Model.VerbaFixa in 'Model\Model.VerbaFixa.pas',
  DAO.PenalizacaoAtrasos in 'DAO\DAO.PenalizacaoAtrasos.pas',
  Model.PenalizacaoAtrasos in 'Model\Model.PenalizacaoAtrasos.pas',
  DAO.VerbaFixa in 'DAO\DAO.VerbaFixa.pas',
  ufrmVerbasExpressas in 'View\ufrmVerbasExpressas.pas' {frmVerbasExpressas},
  DAO.VerbaCEP in 'DAO\DAO.VerbaCEP.pas',
  Model.VerbaCEP in 'Model\Model.VerbaCEP.pas',
  Model.FaixaPeso in 'Model\Model.FaixaPeso.pas',
  Model.FaixaVerba in 'Model\Model.FaixaVerba.pas',
  Model.TabelasDistribuicao in 'Model\Model.TabelasDistribuicao.pas',
  DAO.TabelaDistribuicao in 'DAO\DAO.TabelaDistribuicao.pas',
  DAO.FaixaPeso in 'DAO\DAO.FaixaPeso.pas',
  DAO.FaixaVerba in 'DAO\DAO.FaixaVerba.pas',
  Model.PessoaFisica in 'Model\Model.PessoaFisica.pas',
  Model.PessoaJuridica in 'Model\Model.PessoaJuridica.pas',
  Model.TipoCadastro in 'Model\Model.TipoCadastro.pas',
  Model.Entregas in 'Model\Model.Entregas.pas',
  ufrmTabelasAuxiliaresCadastro in 'View\ufrmTabelasAuxiliaresCadastro.pas' {frmTabelasAuxiliaresCadastro},
  DAO.Departamentos in 'DAO\DAO.Departamentos.pas',
  DAO.TipoCadastro in 'DAO\DAO.TipoCadastro.pas',
  Model.StatusCadastro in 'Model\Model.StatusCadastro.pas',
  DAO.StatusCadastro in 'DAO\DAO.StatusCadastro.pas',
  Model.Funcoes in 'Model\Model.Funcoes.pas',
  DAO.Funcoes in 'DAO\DAO.Funcoes.pas',
  Model.Departamentos in 'Model\Model.Departamentos.pas',
  Model.Cadastro in 'Model\Model.Cadastro.pas',
  DAO.Cadastro in 'DAO\DAO.Cadastro.pas',
  Model.Tiragem in 'Model\Model.Tiragem.pas',
  DAO.Tiragem in 'DAO\DAO.Tiragem.pas',
  ufrmImportacaoTiragemJornal in 'View\ufrmImportacaoTiragemJornal.pas' {frmImportacaoTiragemJornal},
  ufrmCadastro in 'View\ufrmCadastro.pas' {frmCadastro},
  Model.Usuarios in 'Model\Model.Usuarios.pas',
  DAO.Usuarios in 'DAO\DAO.Usuarios.pas',
  ufrmCadastroUsuarios in 'View\ufrmCadastroUsuarios.pas' {frmCadastroUsuarios},
  Model.Acessos in 'Model\Model.Acessos.pas',
  DAO.Acessos in 'DAO\DAO.Acessos.pas',
  DAO.Pesquisa in 'DAO\DAO.Pesquisa.pas',
  Model.AssinaturaJornal in 'Model\Model.AssinaturaJornal.pas',
  DAO.AssinantesJornal in 'DAO\DAO.AssinantesJornal.pas',
  ufrmAssinanteJornal in 'View\ufrmAssinanteJornal.pas' {frmAssinanteJornal},
  Model.OcorrenciasJornal in 'Model\Model.OcorrenciasJornal.pas',
  DAO.OcorrenciasJornal in 'DAO\DAO.OcorrenciasJornal.pas',
  Model.Modalidades in 'Model\Model.Modalidades.pas',
  DAO.Modalidade in 'DAO\DAO.Modalidade.pas',
  Model.Produtos in 'Model\Model.Produtos.pas',
  DAO.Produtos in 'DAO\DAO.Produtos.pas',
  Model.Estados in 'Model\Model.Estados.pas',
  DAO.Estados in 'DAO\DAO.Estados.pas',
  View.ListaProdutosVA in 'View\View.ListaProdutosVA.pas' {view_ListaProdutosVA},
  Model.OcorrenciaEntregador in 'Model\Model.OcorrenciaEntregador.pas',
  DAO.OcorrenciaEntregador in 'DAO\DAO.OcorrenciaEntregador.pas',
  Model.ProdutosVA in 'Model\Model.ProdutosVA.pas',
  Model.InventarioProdutosVA in 'Model\Model.InventarioProdutosVA.pas',
  DAO.ProdutosVA in 'DAO\DAO.ProdutosVA.pas',
  DAO.InventarioProdutosVA in 'DAO\DAO.InventarioProdutosVA.pas',
  View.InventarioProdutosVA in 'View\View.InventarioProdutosVA.pas' {view_InventarioProdutosVA},
  View.CadastroProdutoVA in 'View\View.CadastroProdutoVA.pas' {view_CadastroProdutoVA},
  View.ResultatoProcesso in 'View\View.ResultatoProcesso.pas' {view_ResultadoProcesso},
  View.ApontamentoOperacional in 'View\View.ApontamentoOperacional.pas' {view_ApontamentoOperacional},
  Model.ApontamentoOperacional in 'Model\Model.ApontamentoOperacional.pas',
  DAO.ApontamentoOperacional in 'DAO\DAO.ApontamentoOperacional.pas',
  Model.RHOperacionalAusencias in 'Model\Model.RHOperacionalAusencias.pas',
  DAO.RHOperacionalAusencias in 'DAO\DAO.RHOperacionalAusencias.pas',
  View.OcorrenciasJornal in 'View\View.OcorrenciasJornal.pas' {view_OcorrenciasJornal},
  Thread.PopulaTipoOcorrenciaJornal in 'Thread\Thread.PopulaTipoOcorrenciaJornal.pas',
  Model.TipoOcorrenciaJornal in 'Model\Model.TipoOcorrenciaJornal.pas',
  DAO.TipoOcorrenciaJornal in 'DAO\DAO.TipoOcorrenciaJornal.pas',
  Thread.PopulaTabelasOcorrenciaJornal in 'Thread\Thread.PopulaTabelasOcorrenciaJornal.pas',
  Thread.FinalizaOcorrenciasJornal in 'Thread\Thread.FinalizaOcorrenciasJornal.pas',
  Thread.GravaRemessasVA in 'Thread\Thread.GravaRemessasVA.pas',
  Thread.PopulaEntregadoresJornal in 'Thread\Thread.PopulaEntregadoresJornal.pas',
  Thread.SalvaApontamentoOperacional in 'Thread\Thread.SalvaApontamentoOperacional.pas',
  Model.DistribuidorVA in 'Model\Model.DistribuidorVA.pas',
  DAO.DistribuidorVA in 'DAO\DAO.DistribuidorVA.pas',
  Model.BancaVA in 'Model\Model.BancaVA.pas',
  DAO.BancaVA in 'DAO\DAO.BancaVA.pas',
  Model.RemessasVA in 'Model\Model.RemessasVA.pas',
  DAO.RemessasVA in 'DAO\DAO.RemessasVA.pas',
  View.CadastroBanca in 'View\View.CadastroBanca.pas' {view_CadastroBanca},
  uthrImportarEntregas in 'Thread\uthrImportarEntregas.pas',
  View.ManutencaoRepartes in 'View\View.ManutencaoRepartes.pas' {view_ManutencaoRepartesVA},
  Thread.PopulaApontamentoOperacional in 'Thread\Thread.PopulaApontamentoOperacional.pas',
  Thread.PopulaProdutos in 'Thread\Thread.PopulaProdutos.pas',
  View.CadastroProdutosVA in 'View\View.CadastroProdutosVA.pas' {view_CadastroProdutosVA},
  View.DigitacaoEncalheExpedicao in 'View\View.DigitacaoEncalheExpedicao.pas' {view_DigitacaoEncalheExpedicao},
  ufrmListaEnderecos in 'View\ufrmListaEnderecos.pas' {frmListaEnderecos},
  Thread.PopulaOcorrenciasJornal in 'Thread\Thread.PopulaOcorrenciasJornal.pas',
  Thread.SalvaOcorrenciasJornal in 'Thread\Thread.SalvaOcorrenciasJornal.pas',
  ufrmOcorrenciasJornal in 'View\ufrmOcorrenciasJornal.pas' {frmOcorrenciasJornal},
  Model.EstoqueVA in 'Model\Model.EstoqueVA.pas',
  DAO.EstoqueVA in 'DAO\DAO.EstoqueVA.pas',
  View.EstoqueVA in 'View\View.EstoqueVA.pas' {view_EstoqueVA},
  Model.MovimentoEstoqueVA in 'Model\Model.MovimentoEstoqueVA.pas',
  DAO.MovimentoEstoqueVA in 'DAO\DAO.MovimentoEstoqueVA.pas',
  View.PesquisaExtravios in 'View\View.PesquisaExtravios.pas' {view_PesquisaExtravios},
  DAO.ExtraviosMultas in 'DAO\DAO.ExtraviosMultas.pas',
  Model.DebitosExtravios in 'Model\Model.DebitosExtravios.pas',
  Model.ExtraviosMultas in 'Model\Model.ExtraviosMultas.pas',
  DAO.DebitosExtravios in 'DAO\DAO.DebitosExtravios.pas',
  View.ExtraviosMultas in 'View\View.ExtraviosMultas.pas' {view_ExtraviosMultas},
  Model.Entregadores in 'Model\Model.Entregadores.pas',
  DAO.Entregadores in 'DAO\DAO.Entregadores.pas',
  Common.Utils in 'Common\Common.Utils.pas',
  ufrmPesquisarPessoas in 'View\ufrmPesquisarPessoas.pas' {frmPesquisarPessoas},
  Model.FechamentoLancamento in 'Model\Model.FechamentoLancamento.pas',
  DAO.FechamentoLancamento in 'DAO\DAO.FechamentoLancamento.pas',
  Model.ParcelamentoRestricao in 'Model\Model.ParcelamentoRestricao.pas',
  DAO.ParcelamentoRestricao in 'DAO\DAO.ParcelamentoRestricao.pas',
  Model.FechamentoRestricao in 'Model\Model.FechamentoRestricao.pas',
  DAO.FechamentoRestricao in 'DAO\DAO.FechamentoRestricao.pas',
  Model.FechamentoExpressas in 'Model\Model.FechamentoExpressas.pas',
  Model.ExtratosExpressas in 'Model\Model.ExtratosExpressas.pas',
  DAO.FechamentosExpressas in 'DAO\DAO.FechamentosExpressas.pas',
  DAO.ExtratosExpressas in 'DAO\DAO.ExtratosExpressas.pas',
  View.FechamentoExpressas in 'View\View.FechamentoExpressas.pas' {view_FechamentoExpressas},
  Thread.ProcessaFechamento in 'Thread\Thread.ProcessaFechamento.pas',
  Model.TotalEntregas in 'Model\Model.TotalEntregas.pas',
  DAO.TotalizaEntregas in 'DAO\DAO.TotalizaEntregas.pas',
  View.ExtratoExpressas in 'View\View.ExtratoExpressas.pas' {view_ExtratoExpressas},
  Thread.PopulaExtratoExpressa in 'Thread\Thread.PopulaExtratoExpressa.pas',
  Thread.CancelaFechamentoExtressas in 'Thread\Thread.CancelaFechamentoExtressas.pas',
  Thread.EncerraFechamento in 'Thread\Thread.EncerraFechamento.pas',
  Model.ControleContainer in 'Model\Model.ControleContainer.pas',
  Model.DestinosTransporte in 'Model\Model.DestinosTransporte.pas',
  Model.DestinosViagem in 'Model\Model.DestinosViagem.pas',
  DAO.ControleContainer in 'DAO\DAO.ControleContainer.pas',
  DAO.DesrinosTransporte in 'DAO\DAO.DesrinosTransporte.pas',
  DAO.DestinosViagem in 'DAO\DAO.DestinosViagem.pas',
  View.ImportacaoPlanilhaEntradas in '..\..\Dianomi\Transporte\View\View.ImportacaoPlanilhaEntradas.pas' {view_ImportacaoPlanilhaEntradas},
  Thread.ImportarPlanilhaEntradaCarriers in '..\..\Dianomi\Transporte\Thread\Thread.ImportarPlanilhaEntradaCarriers.pas',
  Model.DestinosTransportes in '..\..\Dianomi\Transporte\Model\Model.DestinosTransportes.pas',
  Model.PlanilhaEntradaCarriers in '..\..\Dianomi\Transporte\Model\Model.PlanilhaEntradaCarriers.pas',
  DAO.PlanilhaEntradaCarriers in '..\..\Dianomi\Transporte\DAO\DAO.PlanilhaEntradaCarriers.pas',
  Data.Module in '..\..\Dianomi\Feedback\Data\Data.Module.pas' {Data_Module: TDataModule},
  Global.Parametros in '..\..\Dianomi\Feedback\Global\Global.Parametros.pas',
  DAO.Entregas in '..\..\Dianomi\Transporte\DAO\DAO.Entregas.pas',
  Model.ControleBaixasTFO in 'Model\Model.ControleBaixasTFO.pas',
  DAO.ControleBaixasTFO in 'DAO\DAO.ControleBaixasTFO.pas',
  uthrImportarCarriers in 'Thread\uthrImportarCarriers.pas',
  DAO.PlanilhaEntradaEntrregas in '..\..\Dianomi\Transporte\DAO\DAO.PlanilhaEntradaEntrregas.pas',
  Model.PlanilhaEntradaEntrregas in '..\..\Dianomi\Transporte\Model\Model.PlanilhaEntradaEntrregas.pas',
  Thread.ImportarPlanilhaEntradaEntregas in '..\..\Dianomi\Transporte\Thread\Thread.ImportarPlanilhaEntradaEntregas.pas',
  ufrmListagemDevolucaoRecebido in 'View\ufrmListagemDevolucaoRecebido.pas' {frmListagemDevolucaoRecebida};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SisGeF';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TData_Module, Data_Module);
  Application.Run;

end.