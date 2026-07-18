<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "BCDTNGAY">
  <!ENTITY controller "rpCashFlowForecastingByDays">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c">
]>

<dir table="bcdtngay" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu dự báo dòng tiền theo ngày" e="Cash Flow Forecasting by Days"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e="Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
    </field>

    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>

    <field name="thu_chi" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Tính chất" e="Property"></header>
      <footer v="1 - Thu, 2 - Chi" e="1 - Inflow, 2 - Outflow"></footer>
      <items style="Mask"/>
    </field>

    <field name="kind" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Theo số dư đầu kỳ, 2 - Theo nguồn dữ liệu" e="1 - On Opening Balance, 2 - On Data Source"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>
    <field name="nguon_dl" clientDefault="Default" defaultValue="1" categoryIndex="1">
      <header v="Nguồn dữ liệu" e="Data Source"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="1. Khế ước cho vay" e="1. Loans Given"/>
        </item>
        <item value="2">
          <text v="2. Khế ước đi vay" e="2. Loans Taken"/>
        </item>
        <item value="3">
          <text v="3. Hóa đơn phải thu" e="3. AR Invoice"/>
        </item>
        <item value="4">
          <text v="4. Hóa đơn phải trả" e="4. AP Invoice"/>
        </item>
        <item value="5">
          <text v="5. Hợp đồng phải thu" e="5. Sales Contract"/>
        </item>
        <item value="6">
          <text v="6. Hợp đồng phải trả" e="6. Purchasing Contract"/>
        </item>
        <item value="7">
          <text v="7. Kế hoạch dòng tiền theo tháng" e="7. Cash Flow Planning by Month"/>
        </item>
        <item value="8">
          <text v="8. Kế hoạch dòng tiền theo tuần" e="8. Cash Flow Planning by Week"/>
        </item>
        <item value="9">
          <text v="9. Đề nghị thu tiền" e="9. Customer Payment Request"/>
        </item>
        <item value="10">
          <text v="10. Đề nghị chi tiền" e="10. Supplier Payment Request"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vzvyLM7i/aaQpuZQZSGNhHilcAS3+L/9FvT0/07ZZRYc</encrypted>]]></clientScript>
    </field>

    <field name="ds_tk" clientDefault="Default" dataFormatString="X">
      <header v="Danh sách tài khoản" e="Accounts"></header>
      <items style="Mask"/>
    </field>
    <field name="ds_chi_tieu" clientDefault="Default">
      <header v="Danh sách chỉ tiêu" e="Articles"></header>
      <items style="Lookup" controller="CashFlowArticles" key="status = '1'" check="1 = 1"/>
    </field>

  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 30, 50, 20, 60, 30, 30, 210"/>
      <item value="101-----1: [stt].Label, [stt], [form]"/>
      <item value="1010-----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="100000000: [form].Description"/>
      <item value="101100000: [kind].Label, [kind], [kind].Description"/>
      <item value="10100000-: [nguon_dl].Label, [nguon_dl]"/>
      <item value="-11000000: [ds_tk].Label, [ds_tk]"/>
      <item value="-11000000: [ds_chi_tieu].Label, [ds_chi_tieu]"/>
      <item value="-11100000: [thu_chi].Label, [thu_chi], [thu_chi].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzmpDYmxp596m9Hye/cuz2dEHE0S3vnAqn84DnFWHGH1</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh30gADG6emiwAjxVR5B78NRDNtgHSLcH6+I55nyAi55BDTPdonHvqp9slQ/wfLLIukg==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzmpDYmxp596m9Hye/cuz2dEHE0S3vnAqn84DnFWHGH1</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh30gADG6emiwAjxVR5B78NRDNtgHSLcH6+I55nyAi55BDTPdonHvqp9slQ/wfLLIukg==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6QSN/T8xb4DzpN/uE5p+zsQtFGx2nZmrT2S8PhI/oQIHDmxvfyjBwaCBbkqMX0v+ZXF12HCBk5TCwCcLbXR53x+7ALHukgn5jbu1EaVjnsmegF251QOhGA9LlfMB47Dz4uAdknVR0igE6O585nog7y325IY8+VWvuoX5dbQ8F+XY2MD9TAgiyLw07RGBzo2EeGnP0PyV5ZZGXETuw+Fe4WGopKkIlFUHICJowUs3sazN6vM/FDJCuCDoNHmv+YjbUaR3PqitCsZMIWL9XNGZpWTwvOmZu9y7Hne6NzoU3K3YH98aUsvnqM6pGDQK3NEJqV5gMcMHWrzRwv0Lb0lMkS58bjT3itMv5Z982eIyWO/Y</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &Set;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1II1gF//A0y1pxU7o4CQkhUBh4NsCSkNJPnfK6hCItHZCNdqIMkNLkqmz5wq0vU6sU887Xo+H86Xpa7mnQomRo=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf7OfC7KeRYm9GABRt5KYfWCrmv2Q+9a7QibH78xasLvUCrJ/SGC7ZxSDuCWSj6oEuokvd4ez9b4ci+pQqnXUGyD3Z5VuiFxDtyRKiNtm3krLlKYF1hct3eCSlZ/vet0eyyX6Ii+9nIhxcN2f4vv5TGkXbBTlbTGJoKj5nbrWGaJvb3tjAMOAIS0ua9a+eesALgu3uybPzfiawi03WNO5WfcnD/4bmVyagaM556LvShlAKDVFYOld98ft79t5uuBgXGffWqvsoSGbH5flkq74eZJZLzYLHQ7917tlZp9dqh3pBPL6jkpmjM2zClA0IOQVCk/gMUTRwboa5UMVwF1Vy+MmU4eCuhRYsvb/jjloWfad4sYQYLoERqCvETkfL2bcxWCMn4u6giuwoE+kXYuYtGIhqUSSW0zIutrYDYbn9Ouq</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1QH6KGqJgn2hV4URa1oRnZdZzmIT5Djed+PtzS18R/5TGi9Sf1poQZnFhzPkPzQbw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &Set;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Ui4GQr/Q/S5x6jwseoz1MrI63a9w9i26T2aYi6WGqPni/SfuQ0hJVLnxrO3fT7DH4sdomCZ/ix+Z5MUoGu3WZes1182sM4KUyQl1HE4fzPilEGILSH70UucVPa4cRsWJDSBAEWzlUNlfgr4U2EXLX2MHW/ktG+jeCzIkGM4KL3aESremnMiao3/CXHgqRRC3E1wG2sHvl2SFJqYghzMDnKV7RZROAO+aePf5bOJfcMi8YneZ9Fo9zLOaYgKibWfR1/vf2U5UrZXgeNor3LIKEI=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        &AfterUpdate;
      </text>
    </command>

    &CheckIrregular;

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NXTUuGR6neR027q67TKWhUWZpFTSoX1Kq3t0fD6DH94</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh39mkZKMOg8eVk5Y7Rau1F2RjMH14RDvnpEejZV6RjSIQQoF4ZmO5VpgoJdqUIMTY1qSM5nKzdERN1uM+NvvZBLg=</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3xgWII8wlIu1VrVO/idcxtYlmc+ayM+5HK8GAzupEE6CQfUOdQ8WQAIzxwcgRfwYaX3cwnFAmrNQfMI0Zv87DdXGUsmhUjMe1k3oyZTNfaQj</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3xgWII8wlIu1VrVO/idcxtag3ciCWpoxk4MO6e+n/IF4JcZu/0W07xgFIK/VD3DNag==</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/Aj8S6ZQizL4SDJh24vHl3N+uT2dbdRZpWXVdWkGAYI+w+JehGe3znIIYStgoxHD1Sg==</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63v1v96GsXRNAmhycQRL2aTUpIWlVETMEAGxqzRphNhuvz</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/Amh12+TJ5PDDDgmV0hQhIEgn9PVAT75wM4jeEzzxrDy5QRzganSYHrM7E88TvD9VRLnn2YXH+B9yzSPSXCaJSC8=</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/ArchhdFGPvg2H7MxRwIZoyBWS84hGe2gw2hKi36vcf9xtA240hvqR97qZKbrMBgYRETfezG6aBUjdcnsNKX3A/arPNHtDv+DK4TP3WPrRKCi</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AnrMAopdf5Pt3hEB+toP2dBPGo665C3/RMsJIETdks/fmaXgCkcLPrWsBFAkHw0H5VmrKgMdoBqJRukwYWDfz0oikW2zKugv4mgOhH8xCJb/GhF7zB1x3gmJrOyd/kHzyQ==</encrypted>]]>&controller;<![CDATA[<encrypted>%S/5bl6Bse+9PUDblZmp/AgjPE4WDyrFdFdOt2NjyN3H1GYrpTIPZgBRhplic6W2KxkUYE22JoH+HpoIx2r1MVnZXjE1X3QXxOhj/bndlrE5tN4Zgx3OtV9JRfTjRUVGA7hRjNQ/3UeNUi8OiouuVGIeYh0f1QA1fl/f62lq6UorCg+Vi/Th8wjUPN6/YkeMFAceasXuxFmwO+SfyH7sUh9mp3xjavvoNmME7cj12TgQpksI33LsjWOLjdP0oX0Wn</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNO1ZTI4dsEbfmSV0//y3Sbt40J8bWnnrdfJlas1hx42OEJygyIS5/rVFnC3LhhBvrA==</encrypted>]]>&controller;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJaiOIXbSHytq6+4O80pc7VuvXLLlnDkQ9c9iIkwhRMCUGrPqbEPh/Ajr0X1bFQppkvg==</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh37JRSe9ABg+4CebxLv2g+TOw/wrPFSrhS5HEH2rmbM5YTAMfLqIyTi/Ri4x/XlktvA==</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh3xHHCpTJvMdHF5sDk2XZLUmIj6WrXoRi1cJm2Cf30NHRLz+FFye7wkpQIxYngpSeEMz95kdEHe17SWv1WtE3Svs=</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63v+U4g1ykJgbVZd8XTxDVEQqzIOgSA1OOzXpo0A1TdFPF2FVCxHjRAVxe7Qcqu6D1xzWCVMCN3DVWJFstdgephu4=</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vwCsnHMw1pMgrhdSPy9ABijpK/K5khY83SbUktFSSTrhzomK4xGOzDugZ3FcWLmRSg==</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNCheXXmUgEF8b6+7qKIR2Vdxe+6n3p2IfARVA4yXjETSORv/J9NE/p1Ku5C4auwHPZIJpL/Bl8NeLgJR4GKPvsQ=</encrypted>]]>&controller;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJaizg/9juHe+oCAN9LCDNOrcBrhPjJIhfY9KVzttoNvQFxznvpAk0i2YBcRUYGzQFcw==</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh312p4tHmlMlEk3Qw2+dnjb4y+CpnEydoGBv6aiTIaP7fetjolQlylIdxIzCB3BrCVafTSBGFfvRzw2KLzD9Ht93oOjwHt1BxLt2LEVgxtpgKmOouDQLnZOavTdc/7HwZhmWSd1KHNGU7n8dbX8tQ/8BjUjX0MSUebiNPPTSLoUPY</encrypted>]]>&controller;<![CDATA[<encrypted>%PWng9w9AoOhgmC6Uiy5NNMHu44EdzLd0+L/EucQ+4LjuJR64IXtnc+5A7sYK0hkoHbb2VRTWeC57hng5M8ZIDEl8hJ10x+bSbtu9QZXgF1NHajm5zdVbEL2zEllfAJe+gYUIHlooqhyZ8tXqgfg3qJxn0B1lUYHwZTI6J2pfxznLz01CkekZp3LRXAbnPBgqVpU5tw02mi0+r0+LgVwIuqXX8JdHgOG0L0Gw1grjRCk9Ep171bvqzc/EsQ8LLPUa+u06AKRt16qv0xhXssyooOJGO8rfYvE1jngItm+N4+o=</encrypted>]]>&controller;<![CDATA[<encrypted>%FW5b+hxw/MxZH0n6N9vh39w5kcgXkzfNhKcz3ib+yGFrx6pc4H9of8VamMVgPKKvqoPYmxpucxn4rcxUTvmYHEOWK10XtNcauN4YNcGu7fTVOiAOyslBcvR+vXi4D81+/mRa0MdFdxe7vGZ6CQ3C7Rs8Va6u+W/POFBBH4nsMJV4kT+p05+VhoRvJam6hJTUH1ZBupQWtLKtwwKqbPBE7AHSJKTEPWffVWbzyLIhMOPKEPidvKVH7uEnOTCRT6td</encrypted>]]>&controller;<![CDATA[<encrypted>%v1A2DmqcSpxbgUfkUnvJardr4kESpTGAqg8S0/mqntghlDu2WB/dJNF4RCM4P5pm6/6eRd3c0TbQ6txLRrBMezhryJrq3gGFpbEJqdG+xckLQ8cRiWR1O+lEU71xaKarbRGzMor5jW/tJVzsT8bAWnhvL/vyXrK3O11mw5CJjbh/+F/Yb+CuBbkWRAl+IWqNLthVHn0cBbLU+9MvUis4oUZgpQnwkOvkT9xT6NM902U=</encrypted>]]>&controller;<![CDATA[<encrypted>%PA75nToWZn/3d/RFaY63vyE62wnqoEVnV/fXGGSwMjU1EPS6yBO7erwOk/uRh6PSGoSRr+QVpOA2B0kP6jiaV5VjINSVUzwfBdLCgVNVHuWPKuKNeTLNXGZD27VyKq5d</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5TX8TpvzODyEuhNpzVN6x99JCg4yxbDYTxmnA6HpBeECXV9z9A3LHLUm5b8CgVXHYylAz60DR7gn6n3nc3dqDtQ==</encrypted>]]>
    </text>
  </css>
</dir>