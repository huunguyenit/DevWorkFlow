<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">


  <!ENTITY GetUnitCode "declare @message nvarchar(4000),  @ma_dvcs varchar(32)
select @message = '', @ma_dvcs = ma_dvcs from @@table where stt_rec = @stt_rec">
  <!ENTITY UpdateConflict "declare @$updateConflict nvarchar(512)
select @$updateConflict = case when @@language = 'v' then N'Đã có chứng từ thanh toán cho hóa đơn này, không thể sửa được.' else N'Can not edit this voucher, It was received or paid.' end">
  <!ENTITY CheckPayment "&UpdateConflict;
if @@action = 'Edit' and @@view = 0 begin
  if exists(select 1 from @@table where loai_tt = 1 and left(stt_rec_tt, 10) = left(@stt_rec, 10)) begin
    select @message as script, @$updateConflict as message
    return
  end
end">
]>

<dir table="cttt20" code="stt_rec" id="HD0" order="ma_dvcs, ngay_ct, so_ct, ma_kh, stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số dư đầu kỳ của hóa đơn" e="Invoice Opening Balance"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l" row="1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="kh_yn = 1 and status = '1'" check="kh_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvntP7j7vIluRbknJLhGYLTmuGJI73NSn3VFfwOqBraSFjw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nvbh">
      <header v="Nhân viên bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản công nợ" e="AR Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and tk_cn = 1 and status = '1'" check="loai_tk = 1 and tk_cn = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="Tổng tiền ngoại tệ" e="Total FC Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="Tổng tiền" e="Total Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tt_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" disabled="true">
      <header v="Tổng tiền phải thu" e="Receivable Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_qd0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="Số tiền đã thu" e="Paid Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" external="true" defaultValue="0" clientDefault="0" filterSource="Ignore" disabled="true">
      <header v="Số tiền còn thu" e="Remaining Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_tt">
      <header v="Mã thanh toán" e="Credit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tat_toan" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Tất toán" e="Write-off"></header>
      <footer v="0 - Chưa tất toán, 1 - Tất toán" e="0 - Not yet, 0 - Written off"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 330"/>
      <item value="11001: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11001: [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="1100: [so_ct].Label, [so_ct]"/>

      <item value="11001: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11001: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="11001: [tk].Label, [tk], [ten_tk%l]"/>

      <item value="11000: [dien_giai].Label, [dien_giai]"/>
      <item value="11001: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1100: [t_tt_nt].Label, [t_tt_nt]"/>
      <item value="1100: [ty_gia].Label, [ty_gia]"/>
      <item value="1100: [t_tt].Label, [t_tt]"/>
      <item value="1100: [t_tt_nt0].Label, [t_tt_nt0]"/>
      <item value="1100: [t_tt_qd0].Label, [t_tt_qd0]"/>
      <item value="1100: [t_cl_nt].Label, [t_cl_nt]"/>

      <item value="11001: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="11100: [tat_toan].Label, [tat_toan], [tat_toan].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuynvFHnr3ErYMqXn8h5rm3hesh5vYhdjfQSYn7oW85Nq/7oqxoLsOAf55BkcI4yPPyFpCmt7VPlVME5PMwkS24fCFmELk7QFKvNtoorb96Qc/mwAUxkgwKcQZKpDbLeM32RPymPEpcje8ceZ4ZwzpNOc0PULCyMUfHXNENCY41aScBNl7NE+93qLhAU2OHaWs6WZLtN9/1jlB9RS99IqFQuQoBAyf/uNUuzLr+Kxk3HEKkRLAIm9r1Xpf0nB9Niq4PqHXnSmGWDQngZ845IDbBw2xE9qqJ1oC1CsyZkRQbwD96cmKFrUNAEAKuUVmQ8iKopPF9x/BDE0VCxjuQ4ifzRMAwPY7t3PAW+wRPGobQQ59kgYHyp6bgsLbYQYtzA34yMgQ14lob4p5jqhgDyQC/p8sdCM93tx9XwTHzqpPP1h</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &GetUnitCode;
        &CommandWhenBalanceBeforeEdit;
        &CheckPayment;
      </text>
    </command>

    <command event="Scattering">
      <text>
        &GetUnitCode;
        &CommandWhenBalanceBeforeEdit;
        &CheckPayment;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPRbB5mzzhVQxydv75n/Vm2lFkhV8N+l2A90R772qeVMSMgAV4P8UcTJcYa1OLzXOpVM4v/BUPa2a293+KogQ1s=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7C0jxTP8IRVKR6Q8exYwzyhtDHpCEsOZvd6k4lfYBvwkcdzAadIW2qZQklz5A7x5SY3Eu5o9OAwmIKkS2cJhigtquNUKmpOr2LMo0rBD8GiZfTSBHXbeIyBYZHs9gk4TSbgTX0c6WymtSwE7pXb1vNezRPN7ChyJq/jE4+tpvaLhLiGhaBKXcUr1n/ATDH5tE/</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        &UpdateConflict;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH11YxsTx3IDtgUV5Y5/ZFZNOfc2WrgwJquV2dXfZlqDAM9bFBVoreBBnfCq8+6/yGQgofOt5ymJ+wVkmMbEibZpTQv4okBfaoR98Z/cJlfEvhBozMQJH7sNvLqSewbsw1s7T7iaG5+qhxzMG93gLQEoYx7UwQ97truvosLLn4UEqqA/3TKNUQMmq+XBgZIIQXOounqMOrclqHKocjG5XvL0SBMhBDzY39rIXntQ/kyZU87akX6+ZU2LajDuJOAD0kHkkuwTzICDxJbinq+ndZiYU8TZk9xQBTnqk5f1ydkat3Xtpa0kpdAOYVqLJ390i3oZOLLJ9WWLzQJnvrwRZCO6VG8IFsRmpeK0eymdYy3LI08SA9pBtqAyuNRO5jmqsJFMJCn005XxU0BTXWzcZM9V6rz46MEZxg7CW9O860ty3bf8RAGYCmnlQ8Z4MQTEdThtCSSBtE0guY2fRRZQkGl9b87TOSTD/uG65b7fS8//TWFVaE90Yj5l/5lpTU5jWAAJEMdZDohSBHIl7vPHZFFawZNcntP5s9+1dnV/pWUM0ndIZzeEBv8ZgSZppq5SCsq</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwa5DGHgPqVixGAA2iPA9YYgfyTTMgJtGPYQJgrYRafcdhu033XfJlm+GOPocOniM/fWjkC8DXBk2QBUIWhY/3c=</Encrypted>]]>&CommandGetIdentityNumber;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFZcn60MjRBa6QaIo6gfLGUABcvod10eXH9I5G0tTt/hHO2E7e4+JEItyPsh4h1iGDzYbrHVsUDz3Ao/Rty+C6yFhOeOHLzE5kPCsUimEpqLCVC0Fx/byXkZaw4IlKAY7/LWrDhq4svQAU15q1PoSi0TVz5SCHI36zZk0hZt4KBp8kXA4rldwW+U3sMuErCr+shHKbnoru1YujhB2BK+pny2tw8O1R8ah5VObQGCol6kCcZcuvmzoanryumZtzrX6AjlHAkoP6/myeqAUBE9gfg=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5zISKH+Og/zmB0lhq1wDRHP4zrheYYLxGpqbiG1QzkPCxf1UT24DAwU9/iBtc+zrD6ZcbY5XA0yIfmCt/sw4f3jradZbKV+OOCtZk9U8JinYBh+6h6zBqPUPm7Nj7xN+2Fy6GA1Sa0+bt3eWFcJbU+k1FoIsVvPuc4TwElXXqw+zg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLcjmhGGXu/XkpYUdh2SZ8RGk4RQ3UOm1kMYMOg7Wvk8mPElSOU5NX/BGHjPFRnn3ua4qAIRtoVSGD2AjCdkABiYi3t0IsOFWVzX8dhrSRbe4zJt07Kc5xjJuxJeuYGRyow94dwHVfdIWB6c3K4sBPv/wxCZ83HfNodUwy0JcWrHUfrOvDPNGm/XOoSyOwMK16</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFZcn60MjRBa6QaIo6gfLGV1efCOP38zfSn699sQzXI2OvowTHBWyUnRc0TaAINJDDEnnBfnMPm34nGvKuH4GZLrh4h+gUH5gUSj8D7ULReuHXjnzb7mi5IVoZk6reCNfCzWUVrMwMNk5hyP5T7WOQGR2CE1csUgfZXEK7wfFnTT153kjo7ltBSC72vDgIKchir0xStgcU67TyWFnIZnvosHhxFZu0knRqE/ensRF9/+Co377p5k2oL1hvNnyHQSDECTACXwJ97qA6r7L1a6SFp3ACSU4szpkIedPfGpaBoUsyhZhke9KpRU0lpqI8x9SRHYb/3+Hk1xMqz9dOXPCd5Ib8B43M9D/m78olz1NSiFcW6FbT9vjPvhlmOyHFILmA==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &GetUnitCode;
        &CommandWhenBalanceBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CBsF0m0ZPHR7oJq7PQJNvkWTkwKSk9cY2vrjMLgya24vlT72H9wqiytKrtdlH4BoYoxB3+1jjDVnjdUqmmXIAYqmky6oLKgmaqz/81++LXaWZ9ZHJ1CdK56bGR2M2SJE4HhEYZIfVxuPAn0Mqa2DicA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtW/O2L6FozK0mC8DTvvZ+dlvin1RV+jBUuNaDrWYL6laW1jronft1rrQwDMAQCk5KIKl+/tbvqp6WnvNeJQ1ss9NoTSKRje7MHJCZvpZ7jFvEgFP/IbUwaHCERcgH4POBxivrsZ0eLZAV2yt4vUZyOD0cIvgKuDe7VCGxt/ivzt/NMGCmQXgBTnvyohKZXUWJZREIXgKjYkuh73SJmr6GTdDEl+pml0fAE2uhyZEdfhxRw6Eniiog66/aZBLA0fnY3GvzH8SKW3FFzoGZJJfD3JZ2qPp5XGMl6LZicFvAIqLihW0FDIj+ILugtVkNOSe5ovezxE48GOAU1xyiJiV7tdgEPSQv5AQy3To4Oq/FE1HtaEA+zNH3rPGv2FAuhw6JtwhIZY26jyefDBCsVu2X9a2dzoS9frHPxeG0cXrgZDYSgysKfg5ecfTb61bbt8YgAskjaVcUltAXgwbgQWwrdybkG7PosI3M8sdnHSgv1gMlvQN8S3G6ZaTn3VR0qVXjkwtldx4I74sSUqkpv6IdL1LiBOtsLm9QnMiFiR6bzOdHhmBayzxKaf4oTsIDLLFFSL/hXoHm7sa30Kp8CV31zaTdkrUuRSE3vKBp73Bcgkwr7kRTYjQz/7xmVvoXNzK7XpmgvQKKhRx5HbPbt/krr1lbZK3Hs3/Q+VyAGyqUNfO+aD7bwCaMq0D8fC+8m80/9dTsfrLWsF7zGWe9jaPGBEicluNmvj0S5qr3wdE2RMXl8evLzSblb2StjQNT3dp09UH9TuytVP+urwOl95vmlcQ4svRGUOOPVa47zmGPaqeSOwVUwHpJMi456HuN/plZ9mGEMN+nN9swlChRpnP4joXISgmNH2oPgLem5LD/KPEeLrWcaXTDpx1+qyTcfMhed0a340Bdua+bc59MA+2JhJdTvD+W0VwOWaiHYKoJ3HqNxYo9zboevEGt2zIztkg5WU8x0dlVM0CxekfgPgAwh02+U0NndPgv/CYOhS6tQVJejERs29Kwvq6i0sSRrFSORM3EdtusJVwqd8sYXprS3ak9J1CNGmxslzIbvZYVs5jlpyWghwjc6B6ocsJKNGNSZR3wtYfs03tC79J3spclw2YQkAn1FmhQ6uLdPJbZ7VPyVcVWkBoXmVJf1bQfMNkaKAmoGrYfoDtXWWziURtj/zYOsBwwktkn0Pr34xsCqNQJrIe+pSiaiTTh7YXlZKDSZobjrlBu+rrSouiuV4LNCq3jkZAJ0psqbyDyzn6zsO3L/If0Yghsm13bMamlWZLBiX2l9igvgk69Hn5BFS1c11MPCWebZLlXDrupEcooOjP</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqa+ujzyTYkv+4oKDKj0hrvpvF8foNtj19ILvz3lhdKIYwcF69+eHPZgHma6MvxHBEiKRPqoWt9zf3axjPl0zlgCraOS2WMI8pNxa7m6sMH9JfggVuaKNd7tJ+sqUYh4Prz+/EE3gpG4decMoGeB760ZIq/awHVicTgvN7zomFEmzkWxJd48VeTNoGtZlVS8I/Lk3xqp787vIir2y7nbPwgvg==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>