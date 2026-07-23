using System.Windows;
using UI.Services;
using UI.ViewModels;
using UI.ViewModels.Explorer;
using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Infrastructure.Design;
using DevWorkFlow.Infrastructure.Services;
using DevWorkFlow.Infrastructure.Skin;
using UI.Docking;
using UI.ViewModels.Skin;
using UI.ViewModels.Bottom;
using UI.ViewModels.Insight;
using UI.ViewModels.Properties;
using UI.ViewModels.Toolbox;
using System.IO;

namespace UI;

public partial class App : Application
{
    private void Application_Startup(object sender, StartupEventArgs e)
    {
        DispatcherUnhandledException += (_, args) =>
        {
            try
            {
                IdeMessage.ShowException(args.Exception, "Đã xảy ra lỗi không xử lý được.");
                args.Handled = true;
            }
            catch
            {
                args.Handled = true;
            }
        };

        TaskScheduler.UnobservedTaskException += (_, args) =>
        {
            try
            {
                Dispatcher.BeginInvoke(() =>
                    IdeMessage.ShowException(args.Exception, "Lỗi nền (task) — thao tác có thể chưa hoàn tất."));
            }
            catch
            {
                // ignore
            }

            args.SetObserved();
        };

        // ── Manual DI composition root ──────────────────────────────
        var nav_service       = new NavigationService();
        var dock_manager      = new DockManager(new JsonDockLayoutStore());
        var template_svc      = new TemplateService();
        var web_config_reader = new WebConfigReader();
        var wcommand_repo     = new WcommandRepository();
        var entity_repo       = new EntityRepository();
        var language_service  = new ErpLanguageService();
        var menu_service      = new MenuService(wcommand_repo, language_service);
        var program_session   = new ProgramSession();
        var settings_store    = new UserSettingsStore();
        var app_config        = new AppConfigStore();
        // Catalog API JS FBO là SoT cho Completion/Hover/Signature — nạp một lần lúc khởi động;
        // thiếu file thì LS giữ catalog rỗng (mất gợi ý, không sập).
        language_service.LoadFboJsCatalog(app_config.GetXmlPath("fbo-js.catalog.xml"));
        language_service.LoadSqlSnippets(app_config.GetXmlPath("sql-snippets.xml"));
        Views.Controls.BindableSqlEditor.SharedSnippetExpander = language_service.TryExpandSqlSnippet;
        Views.Controls.MonacoEditorHost.SharedTheme = app_config.EditorTheme;
        var sql_runner        = new SqlScriptRunner();
        var sql_navigator     = new SqlStudioNavigator();
        var form_navigator    = new FormDocumentNavigator();
        var db_scripter       = new DatabaseObjectScripter(sql_runner, app_config);
        var skin_service      = new ProjectSkinService(
            new LocalSkinStore(), new FboHostNormalizer());
        var project_skin_vm   = new ProjectSkinViewModel(skin_service, program_session);

        // Design module: XML→Semantic→HTML (không phụ thuộc skin capture).
        var design_css_catalog = new DesignCssCatalog(Path.Combine(app_config.ConfigRoot, "css"));
        var design_document_service = new DesignDocumentService(
            language_service,
            new DesignAssetResolver(menu_service),
            new DesignRelatedDocumentLocator(),
            new DesignHtmlGenerator(),
            design_css_catalog);

        FormBuilderViewModel CreateForm() =>
            new(program_session, sql_navigator, language_service, form_navigator, design_document_service,
                app_config.ConfigRoot, db_scripter);

        var seed_form       = CreateForm();
        var navigation_vm   = new NavigationViewModel(
            nav_service, web_config_reader, menu_service, program_session, entity_repo,
            form_navigator, settings_store, sql_navigator, language_service, app_config);
        var explorer_vm     = new ProjectExplorerViewModel(
            program_session, form_navigator, navigation_vm, sql_navigator, app_config);
        var database_explorer_vm = new DatabaseExplorerViewModel(
            program_session, sql_runner, app_config, db_scripter, sql_navigator);
        _ = new LeftExplorerLoadCoordinator(program_session, explorer_vm, database_explorer_vm);

        var outline_vm      = new OutlineViewModel(seed_form, language_service);
        var property_grid_vm = new PropertyGridViewModel(seed_form);
        var toolbox_vm      = new ToolboxViewModel();
        var insight_panel_vm = new InsightPanelViewModel(seed_form);
        var symbol_info_vm  = new SymbolInfoViewModel(language_service, seed_form);
        var diagnostics_vm  = new IdeDiagnosticsViewModel(app_config);
        var xml_bottom_vm   = new XmlBottomViewModel(seed_form);
        var diagnostics_bridge = new FormBuilderDiagnosticsBridge(
            diagnostics_vm, seed_form);
        var catalog_vm      = new TemplateManagerViewModel(template_svc, nav_service, TemplateType.Catalog);
        var document_vm     = new TemplateManagerViewModel(template_svc, nav_service, TemplateType.Document);
        var report_vm       = new TemplateManagerViewModel(template_svc, nav_service, TemplateType.Report);
        var stored_vm       = new TemplateManagerViewModel(template_svc, nav_service, TemplateType.Stored);

        var main_vm = new MainViewModel(
            nav_service, program_session, dock_manager, sql_runner, sql_navigator,
            form_navigator, language_service, CreateForm,
            navigation_vm, seed_form,
            explorer_vm, database_explorer_vm, outline_vm, property_grid_vm, toolbox_vm,
            insight_panel_vm, symbol_info_vm,
            xml_bottom_vm, diagnostics_vm, diagnostics_bridge,
            catalog_vm, document_vm, report_vm, stored_vm, project_skin_vm);

        var main_window = new MainWindow { DataContext = main_vm };
        main_window.Loaded += async (_, _) =>
        {
            try
            {
                await navigation_vm.TryRestoreLastProgramAsync();
            }
            catch (Exception ex)
            {
                IdeMessage.ShowException(ex, "Không khôi phục được Program lần trước.");
            }
        };
        main_window.Closing += (_, _) =>
        {
            try { main_vm.Shell.SaveDockLayout(); }
            catch { /* ignore persist errors on exit */ }
        };
        main_window.Show();
    }
}
