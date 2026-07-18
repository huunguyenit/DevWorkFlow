<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLChargeQuery SYSTEM "..\Include\XML\ChargeQuery.xml">
  <!ENTITY XMLWhenChargeLoading SYSTEM "..\Include\XML\WhenChargeLoading.xml">
  <!ENTITY XMLWhenChargeClosing SYSTEM "..\Include\XML\WhenChargeClosing.xml">
  <!ENTITY ScriptChargeClose SYSTEM "..\Include\Javascript\ChargeClose.txt">

  <!ENTITY f ", t_tt: '[t_tt]:=[t_thue]+[t_cp]', t_tt_nt: '[t_tt_nt]:=[t_thue_nt]+[t_cp_nt]'">
]>

<grid table="r60$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="2" id="PNC" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c73$000000" prime="r60$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUcqBB5bOrh2ik7E0+KkoQYh+F3JX0sb37WejbDW1NkUN2yPTWlmcTG/DznPnz6kDVxEhvHoF9VCfY1S+Rk9GwxZItnjMS0Y8CgFSsp+G2pS9zHsRVXi66pDsCjP2GBSqtSZPF+lttNhktAGhzafq6YfZswjEsjNi58f114R1yg+bV4FKGLwA9kAGpw3Mt6u40sRYP9gvH/cup9Z5XSYDQxGDTH+aSKA6fycaDJreXVw4jM6WXB/YL5JAkMOdcqz2iMcvjCrY6yZfcAW5otgWbpgQONk/FmFELsmuW5RuTAsTXCppRTjiEOBZMqA77yxZcjw/tZ48lG3xPYwH1/vz+rJH7PCXHb2jlbjZwi2USFfjdExL2uFpYyNQhNXqN2wRup4DdVSp2VYDDq9a4j9RpA7bRe+k3b04WV6rJdtIKUPxziI1oALZK1AggrODelfsSIFRNuxpkbngMHRHV/wdmLaNFnEuaMA99gCKn/ksqFHlvq1G1QzZI+QXWv4wKcFEKjSuWw3YiBzyBvd++8KNO9sAWEskkG1wuK2HIit8sOB55SPVOVjGiWwmtW/bcoGHbQh9XRXIvifMj2jYk0XqyEyYrjZr/lfxNPGCaYmQKrs2QD/avU45Jk+WHa0ocydTFPt/cTcmOYelxwKqJm3lijYDBodMRm/1g08CveCRR8ysZsAmWP7dW7w5yxagWQs+fJlyP/GqK0QEZQFQ9gzdmcDR1YO4942Yyp8m6Qpn5dyMnj8U57Q+DgwcyGxWNXcZ+ITF66L01DHA9yrtO6KeeZv+/bkaanP4ST5oxSLyhGDLiBaaVxSDubOuWsDThW8SvQ5gC13bF3FNHASxzmwjyX+ZCCWqSWb6LuVQXpZUHPP7lbqWGdkyyyITnWFaKdKNFwrb9lHCYlzctRK6a+6APwtIv7tsBQk3/+eIfAcRK7OfxLxbwKrxhE+N6uxd3okKaE0cXamFmRc1OZP7nVHDW/RUyNN0ZYXw5IukO1JKRpj60hYNULBW2/Oe5y307GnbUGPfipxsHcKtlic73KSPIJB4PwWFQ1Xg0FQ9qG3pPwFjGhDR5o5Ks205ROoU7/7IfxrQQJNfg/riW8mMGUQjZf8XLxZ6hXAhgLXpLt3eNne3i4il113+pWQbPK1q5gEDpG9g/gv1O5jBQ03r0eqPTeU710iE2U1N0gwxfBW31CVDcHHqlD9DLtjg7IKGy3GIZd4UmpegceDi7d23qNS/YRndrJR6KxdwCPeVdmRpm2hpkZM84kKQbQMWxMCbG2MLCyV1yM2N4q/TeMt8c+aJ5oPRnu8zlZcr5B+RFz/j0f/fKgVKxpciO9WPy+fggQPejjhgOSkxs+z9RSohOS2iRGp3k7mc0bHMdW/W1BnG/3u7UxnsaoFcsZFq+VTu18U/sOCYZnsPHAdXlXhol6jBbSjMD2OS1u6us3cSGJpahfz3WDRlplyVSbRadu7Ab9JCC0FdjayR/Mi9Qf7cdNAOY0rUgU8bAfYsVJQk/NBHrRjErgua2xpBsiSBf3OaEMGb1RD6KdehbfJpZQNhS/3zVMCcz0z8ZwK5gBnJpdS0THWefQNyzxZ+cAOtRjjW3icebw6Ax1j5Cj6z+S4LQyRvfoseXPBEkzG+89G5y3bqmRpjYr1OL8mdW14QW5pS9jwGFf+DRCGfHx3igq7221sZOLfEnambxKz5zZPVvkMkRGzD2r+HWLVi1jfMTFFQJsMMKuAzcSkNtg2OCSUVUJFqYp3dfPQSUKF+xEZqm0r5eZRCCvgVRv3FeSDoHvBZqyqbrB6KW7//jDKS+YQOSU6siTFwXmcAFnoDnoDXqhu85QSONgDLCzXh1H5ndbisKeo7fD6QwX6B6UG9y9iaxGGH0RfWTZwgJFKTWhHelLsCTFmCnx+/gnJreNMPf7c3yIVB3LckKZB26ubSZEv26If6LRqLvXODN+gitT9HIW2uPjR</Encrypted>]]>
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
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy5PiQSDUq6ETw5QEoC03AGEXjQnb/wBd3JSeF8iEL7dG/ZP6HjkoJhux/JgRc/6BtCUCPEzz4Ytb364ZzqCyRKeuglg8NwZMPheGAu2kIyzgfGVgMDvnRDfDlmx4A1IRLaMpfop3OXYBZtMek6Ph5BUL1yBo/7WKSRuar6Zwk7T655SO6YVOQj7EgwkkXggbbrEMaazT2kqVCI0sqyYQGI1doaX+hI4KrI5xBBmXO0A</Encrypted>]]>
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
      <title v="Phân bổ$$75" e="Allocate$"></title>
    </button>
    <button command="Change">
      <title v="Sửa chi phí phân bổ$$90" e="Edit$"></title>
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