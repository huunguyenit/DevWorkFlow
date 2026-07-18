<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\Tag.txt">
]>

<grid table="crdmtgsp" type="Detail" code="ma_vt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="tag" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      <header v="&lt;div id='FlowGridTagId' onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div id='FlowGridTagId' onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_vt" width="100" readOnly="true">
      <header v="Mã sản phẩm" e="Product Code"></header>
    </field>
    <field name="ten_vt" width="300" readOnly="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="dvt" width="60" readOnly="true">
      <header v="Đvt" e="UOM"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="dvt"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcC6hK3SZrOBuGTy0N4cLcXcoe8qynx2fqFk17MQawSfqgk/72uktKavFBsDmvMKWwmny1VN/9KYRlrvH/InohJs=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKXoDhppNgodsWkWZTnT9GGgykv4uPgK2WP404TAOX7mgcXvr35l0DAWi0+5G8udXUG5WNtBgMi6UisGdfblm1/4</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT11JZnhm02cPtNCW3BX08XEhysoE96FOADTi+Z/VlXc2Jykw8GV+/2R4kXTJoG8kUBrQ+08Z/oV3/zGqvWx4gnP0dVrVzyXYj3otUPqC2F+g/VvC2nWdd0624Rp8GrA3WGU2vYJcjn0lOxPlrLI0gdWYudQrVDdc1HLvPmsIN1RxnzpyLvWNOibiWV+BNEWt/PbnU8Q3l1v2bwxX6ZEIHcwiAzO5IilO7VKuF5Ya9A3S8euifNoEe7DSDEWNuzIHZRDIaVdCGM4Ve5ruwp1E2yDfElTDYZU7Ymp45/QdRt9zyA4Mv8nuoYpq/PqsDjfn3LnTZkOlSWdVYed2xKVEQBqRGnDEH28BiqPQIf7soI+OyVrzHoQqr0gF3yQkndi9om1Sf08oPeIY5nc6xtZQ6X+S8E4u2/z8+W6q47VX8Y7WOssf19ukVkBkyOHhpX9I3JBmsbURm7LHU0ULEfq1kR1qImfWl2LduDz3fhRdkcHIIlFAhyPdA2dTgUs914rpUvl/i9GbW+i3jnyu9q80NGlsrNEGN59CPOLPkmsv2ZldCLSmgdt7WFB0dZsjqEB6/xiRIyyyBByKRaDzVcvmps4qmSg+WoMC3o1zGgxiWVMSR60x6jwo5aEkm5KO+BsbdOOCbsxHQRKVysQCPmzxHYKPXh1e76f2pE6/VCTSkGPokdXk7aZp2r0WL6TdyH46dE0HNznf6qzXSly5gWKDobNS</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGViuOnmIh+Wg5Rogos7QoFSOIoFACHGSzoEqEuzXz7N4gJKkdfixuGVFqR+DnAkODLY5xSjShigjZ9swG3QPJf7by9pHF3GvW/wkZNoq5jibn5HAoGANKKls/aHUUNo+9mE2+RPyHEphkIJ56H6qwABOxN2Es6VBpfNEOEbXc737Sndopy465qZf4puxjHq1BuBWLaKvVzVkiteDQEMkKmgWvWqyXJb7Eb42ryLww9nrSudNYHUO0C6pURJacrkvcuPLpENiIf0C2gdkhpzjdEwDBtOrS4Vij9zVt4iv4pdzMOF0YCrPxhiY6KtSQFA8jRWCT8vR/QW0idJOgyjRuu+gedXAI2D0+zlKucHT7EJWGIIMcUn1anM3C1eYRZEL9ssKdVnphrin9XFadOxKnuu/XPGxrEXz5Jhesvd22tfiia35dAlrB+0VI7k/ZeNBY4/RrRX8Nglt0p3YrwgjAzYjUH/20nekVlQ44+swgJKVDZdE10EE3M9aaSPkZpArPvm9cDYcQIC/rlU218gwRj8Qg</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="PostData">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCCvUeh8oRF4cKdXZqR1sVh3zBOb3zOlM6JqXM/Nw6f13fT4Fy5R39/auIFzW6qWpCqvsgiE7vIgpoZ9GRzuvlQyVm6/UwXB9Ki2BDhFsF5LubRhn2Lf8BXSUXTjEw2sx/d0h/K8MBkIgsMwquvnfQQM6QOm5VKO7CtxVJCz5jemJy2NFlW0yXDAL6YjEqWs89itvSVNG8+1qDszxxJWw4wgUSXpXMsIAJxAsKAjsXHE0PLRpsTNQmyShglGuCTxvbYtCJqfqNieaisoGL9PlfB6uFZ6KdgVWMJbVloR0nkQ0mQEJZfcSVvDpBf9csXXpyVi+guIFNwQutF5CDan8hxzHInUuX9HL2js02JHoVmRtjxc7xznZy8ldkAtk6JoLQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>