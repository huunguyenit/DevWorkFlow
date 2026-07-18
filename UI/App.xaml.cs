using System.Windows;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Infrastructure.Services;
using UI.Docking;
using UI.Services;
using UI.ViewModels;
using UI.ViewModels.Bottom;
using UI.ViewModels.Explorer;
using UI.ViewModels.Insight;
using UI.ViewModels.Properties;
using UI.ViewModels.Toolbox;

namespace UI;

public partial class App : Application
{
    private void Application_Startup(object sender, StartupEventArgs e)
    {
        // ── Manual DI composition root ──────────────────────────────
        var nav_service       = new NavigationService();
        var dock_service      = new DockService();
        var template_svc      = new TemplateService();
        var form_svc          = new FormService();
        var web_config_reader = new WebConfigReader();
        var wcommand_repo     = new WcommandRepository();
        var entity_repo       = new EntityRepository();
        var language_service  = new ErpLanguageService();
        var menu_service      = new MenuService(wcommand_repo, language_service);
        var program_session   = new ProgramSession();
        var settings_store    = new UserSettingsStore();
        var app_config        = new AppConfigStore();
        var sql_runner        = new SqlScriptRunner();
        var sql_navigator     = new SqlStudioNavigator();
        var form_navigator    = new FormDocumentNavigator();
        var db_scripter       = new DatabaseObjectScripter(sql_runner, app_config);

        FormBuilderViewModel CreateForm() =>
            new(form_svc, program_session, sql_navigator, language_service);

        var seed_form       = CreateForm();
        var navigation_vm   = new NavigationViewModel(
            nav_service, web_config_reader, menu_service, program_session, entity_repo,
            form_navigator, settings_store, sql_navigator, language_service, app_config);
        var explorer_vm     = new ProjectExplorerViewModel(
            program_session, form_navigator, navigation_vm, sql_navigator, app_config);
        var database_explorer_vm = new DatabaseExplorerViewModel(
            program_session, sql_runner, app_config, db_scripter, sql_navigator);
        _ = new LeftExplorerLoadCoordinator(program_session, explorer_vm, database_explorer_vm);

        // Khôi phục Program sau khi coordinator đã subscribe ProgramChanged.
        _ = navigation_vm.TryRestoreLastProgramAsync();

        var outline_vm      = new OutlineViewModel(seed_form, language_service);
        var property_grid_vm = new PropertyGridViewModel(seed_form);
        var toolbox_vm      = new ToolboxViewModel();
        var insight_panel_vm = new InsightPanelViewModel(seed_form);
        var symbol_info_vm  = new SymbolInfoViewModel(language_service, seed_form);
        var diagnostics_vm  = new IdeDiagnosticsViewModel();
        var xml_bottom_vm   = new XmlBottomViewModel(seed_form);
        var diagnostics_bridge = new FormBuilderDiagnosticsBridge(
            diagnostics_vm, language_service, seed_form);
        var catalog_vm      = new TemplateManagerViewModel(template_svc, form_svc, nav_service, TemplateType.Catalog);
        var document_vm     = new TemplateManagerViewModel(template_svc, form_svc, nav_service, TemplateType.Document);
        var report_vm       = new TemplateManagerViewModel(template_svc, form_svc, nav_service, TemplateType.Report);
        var stored_vm       = new TemplateManagerViewModel(template_svc, form_svc, nav_service, TemplateType.Stored);

        var main_vm = new MainViewModel(
            nav_service, program_session, dock_service, sql_runner, sql_navigator,
            form_navigator, language_service, CreateForm,
            navigation_vm, seed_form,
            explorer_vm, database_explorer_vm, outline_vm, property_grid_vm, toolbox_vm,
            insight_panel_vm, symbol_info_vm,
            xml_bottom_vm, diagnostics_vm, diagnostics_bridge,
            catalog_vm, document_vm, report_vm, stored_vm);

        var main_window = new MainWindow { DataContext = main_vm };
        main_window.Show();
    }
}
