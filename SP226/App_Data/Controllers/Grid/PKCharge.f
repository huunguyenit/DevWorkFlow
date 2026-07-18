<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLChargeFields SYSTEM "..\Include\XML\ChargeFields.txt">
  <!ENTITY XMLChargeViews SYSTEM "..\Include\XML\ChargeViews.txt">
  <!ENTITY XMLChargeQuery SYSTEM "..\Include\XML\ChargeQuery.xml">
  <!ENTITY XMLWhenChargeLoading SYSTEM "..\Include\XML\WhenChargeLoading.xml">
  <!ENTITY XMLWhenChargeClosing SYSTEM "..\Include\XML\WhenChargeClosing.xml">
  <!ENTITY ScriptChargeInit SYSTEM "..\Include\Javascript\ChargeInit.txt">
  <!ENTITY ScriptChargeClose SYSTEM "..\Include\Javascript\ChargeClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY f ", t_tt_nt: '[t_tt_nt]:=[t_tien_nt0]+[t_cp_nt]+[t_nk_nt]+[t_ttdb_nt]+[t_thue_nt]', t_tt: '[t_tt]:=[t_tien0]+[t_cp]+[t_nk]+[t_ttdb]+[t_thue]'">
]>

<grid table="r60$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="2" id="PD3" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c98$000000" prime="r60$" inquiry="i98$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_cp" allowNulls="false" width="100" aliasName="a">
      <header v="Mã chi phí" e="Charge"></header>
      <items style="AutoComplete" controller="Charge" reference="ten_cp%l" key="status = '1' and (ma_ct = @@id or ma_ct = '')" check="ma_ct = @@id or ma_ct = ''" information="ma_loai$dmcp.ten_cp%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrw2LqpTomUcrxz44NH6ax7aIYZNKsy/F899paJluopl+g1UcAfGyXYhpvlZC0OuDE=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_cp%l" readOnly="false" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên chi phí" e="Charge Description"></header>
    </field>
    <field name="tien_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_pb" width="0" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="loai_cp" width="0" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_cp"/>
      <field name="ten_cp%l"/>
      <field name="tien_cp_nt"/>
      <field name="tien_cp"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="loai_pb"/>
      <field name="loai_cp"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    &XMLWhenChargeLoading;
    &XMLWhenChargeClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUcqBB5bOrh2ik7E0+KkoQYh+F3JX0sb37WejbDW1NkUN2yPTWlmcTG/DznPnz6kDVxEhvHoF9VCfY1S+Rk9GwxZItnjMS0Y8CgFSsp+G2pS9zHsRVXi66pDsCjP2GBSqtSZPF+lttNhktAGhzafq6YfZswjEsjNi58f114R1yg+OuYbgAJ82wGJgOQYjlCdsp13LV945Lm79uWkllfU014UUl+dGDvzu5ae0sYAnkYaJleYDdhx4cQrPGUaO4LPvMYdnLSBCBZnz3WPmJ2BwGDa7E0TlpcNNfmb/Wrl/xegABSXuOoN5znYMiT9gVTrdzswGuh2tEoNZrNanmT9Go3O4TYl9Zfdd+DACqa+G1ILTBBC60U0LCG1xNHCM/d7E4hi1DuPnroFzGO7v3AHS3xh9SkqeBroAfQ9k59HbB/LDfpCtylZDJHXNoKp0eh8pYkWl+RsCFInfI+SF3BFJDWSxhFYAflsxjNgB+AyEv8KVJkCF7BDjodbowWFLmWz7MouBRPmFK8nf7vtLS8D6yk76RE0P9q2i4qtMmjzLtfcHgzrRaZ4eG84+2NowPJWNIJBFpUlb4Qjz4QwDApcKM5XJaAITPg9pkPhvEpDzGy8yIvw7Sef3CCJ9Ya95wzNSz9RO2J4XHj3/Ky3GNRKx27mdx/fUu5+T70JHfsC4xji82w+piVfPIngdoleoK601PfqA4yCuAErBfUI/i5bss3iRlGXQFCFEkt1SUdHjVKJa7CHtiYoUyKPEfhggpCY2s2yFps1KXdDNcKOILbhnpTrjeNXzte9AyXJztCPNK1At1QFBssAKiHqnF8bj8/JkGlJ/mORktBHMhT3jW5yO+IwnQf6GHaRlRO+Ur8cZ8RiwFAoyhJB/3ciPHIyp1xNKwfMyq7PwvkuJv18P4Bksa4MX+FkgijP+RqWVOSjut7RRsGKZUYu6kQIWaooEDWCtso+Ebraa+ow4Wq2wX09xk7TFS818WqE1OHqi1zUebSLJr4GjOOlNQUckxksSXkFZrnPYxlksWIpqkJglKi3MbV4QDHKmUYNdCJsrSd8x+9cLN3OwtNZT8yhFKQvgE/nsIKpI+Gn7OBr1NTYqyE9nG7h0FhQh0PmCp6rETmypLqA7KoWLQTatYEIv4KmyvzXFPVlDAmbahPCqQ7fGj+T0jZo67tRPC8nDt/EYkomymclCqc62UYdycQ2F0i7CZ9lt8oYGxzEVu9OHakMpJ7Kg9KZlwwUmaRpjmmOLFylNeSiM0rWAnszzeMHbBx4yUEBljFWDmWFW7+raHnuWGHZgkhAxbSgTh89Tz2D8km8byQcPt+8R8ujUOTlKQTLGDPSiM2Qv9I8u1phQzBsIzEqz+lVhbTC4e/cdIVMnvjZIVGiP/7XE57B9Ag/jB0FMQMAeQrPMIGiJYfJjwxCKRx2IkpJUI8y7LtOpS5ey0wSqH5kMmAj2vE2IqVSYN2WzXGAWPrhrmegGmd39LLaHdWnDZK8ce9hJ2DflKoM3opak1JTHsFAvb3ohaBPBzkQ3OkPdFDnh7Zf7ckd0Zxi99UeD91W8zyaGkCQqpNAqHGn0n7LrR7qJ73BXlCziz8rPI3WOpWuTs8ztTF+8hSY1a98jIbw9cwD1oX6Y4V04Rh3hU29jf585uug8FvBCS8+B7lIDlDENQpfhklq3ERdnNQrWBw6X+/ZVdrEdM8y9EWxqErvXhBEkzSC0qvI+AgX9jKdrV4nTskMS18Nd9jWOk38keNdGSjWOizXgFiSXiCIL9W1XHWNE7fuvrKVRLdx8+rAr87/o4yGa6Mf596rylO9EpkasZiBv00Q4caOR74A2w7Ycnis3jGE7ACyKzgVB+bV9wLHwT8NY3jcrxnqhn0TsVmbGROr8oGoAA9TTaBM5cRlKLQSoG+7kr0qHYzVdtVCRlVtL/tMU6Wc+y2j9gXjczk=</Encrypted>]]>
      &f;&ScriptChargeClose;
    </text>
  </script>

  <response>
    <action id="Charge">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7PAtmX9jjVS28iKdUOm0XMYAQlZYDlHI6c7HZUegFYKq81QAsXu9w2Zi/L9uvbYX+5pILVrXYCcWj+BpNojP7l6EJyuafy/+ONbC+4tXH66A==</Encrypted>]]>
      </text>
    </action>
  </response>

  &XMLChargeQuery;

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy5PiQSDUq6ETw5QEoC03AGEXjQnb/wBd3JSeF8iEL7dG/ZP6HjkoJhux/JgRc/6BtCUCPEzz4Ytb364ZzqCyRL/H5Iz4eAjdDLU/26RLIru00ulCi84uwXZislGML6RbE8Nz1Q4NFPNkYr4vwoKnrN2fvtKyeClG61Q9Xm9+cHEd3StMK70c1YjkR6Xj1ifvA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Allocate">
      <title v="Phân bổ chi phí$$120" e="Allocate$"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>