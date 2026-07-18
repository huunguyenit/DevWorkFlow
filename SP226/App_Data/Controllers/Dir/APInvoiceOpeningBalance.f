<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">

  <!ENTITY GetUnitCode "declare @message nvarchar(4000), @ma_dvcs varchar(32)
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

<dir table="cttt30" code="stt_rec" id="PN0" order="ma_dvcs, ngay_ct, so_ct, ma_kh, stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số dư đầu kỳ của hóa đơn" e="Invoice Opening Balance"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false" clientDefault="Default" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l" row="1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hạch toán" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="cc_yn = 1 and status = '1'" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvntP7j7vIluRbknJLhGYLTmuGJI73NSn3VFfwOqBraSFjw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản công nợ" e="AP Account"></header>
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
      <header v="Tổng tiền phải trả" e="Payable Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_qd0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="Số tiền đã trả" e="Paid Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" external="true" defaultValue="0" clientDefault="0" filterSource="Ignore" disabled="true">
      <header v="Số tiền còn trả" e="Remaining Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_tt">
      <header v="Mã thanh toán" e="Debit Term"></header>
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
      <item value="1100: [ngay_ct0].Label, [ngay_ct0]"/>
      <item value="1100: [so_ct].Label, [so_ct]"/>

      <item value="11001: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH11YxsTx3IDtgUV5Y5/ZFZNOfc2WrgwJquV2dXfZlqDAM9bFBVoreBBnfCq8+6/yGQgofOt5ymJ+wVkmMbEibZpTQv4okBfaoR98Z/cJlfEvhBozMQJH7sNvLqSewbsw1s7T7iaG5+qhxzMG93gLQEoYx7UwQ97truvosLLn4UEqqA/3TKNUQMmq+XBgZIIQXOounqMOrclqHKocjG5XvL0SBMhBDzY39rIXntQ/kyZU87akX6+ZU2LajDuJOAD0kHkkuwTzICDxJbinq+ndZiYU8TZk9xQBTnqk5f1ydkat3Xtpa0kpdAOYVqLJ390i3oZOLLJ9WWLzQJnvrwRZCO6VG8IFsRmpeK0eymdYy3LI08SA9pBtqAyuNRO5jmqsJFMJCn005XxU0BTXWzcZM9V6rz46MEZxg7CW9O860ty3bf8RAGYCmnlQ8Z4MQTEdThMDs1ivHJXRhe2feJA77pHIgH7mIy8R0FnPSxSCvM+MZT4hDoOSXUH0V4IT+NDKrUvHoixlgd6vH1cTbQpWSqBCJ6Y8aAgi1sAxJKdO8ctNxHI6dCFFgBQUdbIZ5pLjdx</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwa5DGHgPqVixGAA2iPA9YYgfyTTMgJtGPYQJgrYRafcdhu033XfJlm+GOPocOniM/fWjkC8DXBk2QBUIWhY/3c=</Encrypted>]]>&CommandGetIdentityNumber;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFZcn60MjRBa6QaIo6gfLGUABcvod10eXH9I5G0tTt/hHO2E7e4+JEItyPsh4h1iGDzYbrHVsUDz3Ao/Rty+C6yFhOeOHLzE5kPCsUimEpqLCVC0Fx/byXkZaw4IlKAY79G9ZH1kJdshamBNa4n6abRPZIACIVbCy5t3vbV9LVi9v7RupR0cLGcselwK9uhBNOXm5k9/pQhf+aEqz3rDFnlQTq9B/brn3LPl/lUzygTnbdweRxjmf9Zo/cgHrNEeEOPdev4Qs6h49YLQhDxq49ffWexDKQibvWvv0iDwfPNu</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380YrnVLxkq/CAUjyI1/fetzZllDkqfHxefFw60grPbyULGw6WfSlZ0f9WpqzAaQR7cifek9hO5J42JuQqrjfDq4iY7cpufI+MwOGde6janNFo=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLcjmhGGXu/XkpYUdh2SZ8RGk4RQ3UOm1kMYMOg7Wvk8mPElSOU5NX/BGHjPFRnn3ua4qAIRtoVSGD2AjCdkABiYi3t0IsOFWVzX8dhrSRbe4zJt07Kc5xjJuxJeuYGRyow94dwHVfdIWB6c3K4sBPv/wxCZ83HfNodUwy0JcWrHUfrOvDPNGm/XOoSyOwMK16</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFZcn60MjRBa6QaIo6gfLGV1efCOP38zfSn699sQzXI2Tl7CCBLM9XLhizu//QaZN5X6Zq+kOAInibV3CpjxYnwxOQLjKXe70I2uH8OrKt8L1AxEGpER6R3iPETN4n9t8mAKCFq86yxJkOClo9Jlwf04VBPt7oHR2e/9dnGLNbBXF9NQmnerOI77GeIna4tiVDu8ETjs0NzJr0+6gPqu0NKjR5JYethA8sEuXt7XqWIeGrygi1TL1tLXNz/eBeirW8LZS6cJwDit6UG5BOJyy8NTbteVDRO9QqG+sPmy62zozUUsLE1sMFQJ3Ffya75EcRAeaybREbS3Zi0da/q6FPubWO7kRBwmu9ftQU/6A4sPU0fT9Rzo1CBvMgIOXbjmzA==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqaxtk81KWB7g2dSY6ulSogGgqkFCOD3dEnjzKjXsGEmYG5S+552kefzC+tueOKgBUFvzDVh8rXpCywhkJ+3/tom5yW9hyLOgaFdiFI8sUF3Ldw1TQKUYeSdlXDt0JYs5DuJqoKthZ32PWuQrO6XnGteHumFGd/+QDUTvaIkZznLAPLhS3lgnDfnlgv68jqgB4DZtjXg/Wz8E6BbQREkgDAAQ==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>