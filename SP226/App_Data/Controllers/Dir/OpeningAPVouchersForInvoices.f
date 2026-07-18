<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">

  <!ENTITY GetUnitCode "declare @message nvarchar(4000),  @ma_dvcs varchar(32)
select @message = '', @ma_dvcs = ma_dvcs from @@table where stt_rec = @stt_rec">
  <!ENTITY UpdateConflict "declare @$updateConflict nvarchar(512)
select @$updateConflict = case when @@language = 'v' then N'Chứng từ đã được phân bổ, không thể sửa được.' else N'Can not edit this voucher, It was distributed.' end">
  <!ENTITY CheckPayment "&UpdateConflict;
if @@action = 'Edit' and @@view = 0 begin
  if exists(select 1 from cttt30 where loai_tt = 1 and stt_rec = @stt_rec) begin
    select @message as script, @$updateConflict as message
    return
  end
end">
  <!ENTITY Post "
declare @ma_nt0 char(3)
select @ma_nt0 = rtrim(val) from options where name = 'm_ma_nt0'
if @@action = 'Edit' delete cttt60 where stt_rec = @stt_rec
insert into cttt60(stt_rec, ma_dvcs, loai_ct, ma_ct, ngay_ct, so_ct, ma_kh, dien_giai, tk, ma_nt, ty_gia, t_tt_nt, t_tt, t_tien_pb_nt, t_tien_pb, da_pb, stt_rec_pb, status, datetime0, datetime2, user_id0, user_id2)
  select stt_rec, ma_dvcs, loai_ct, ma_ct, ngay_ct, so_ct, ma_kh, dien_giai, tk, ma_nt, ty_gia, case when ma_nt = @ma_nt0 then t_tien else t_tien_nt end, t_tien, case when ma_nt = @ma_nt0 then t_tien_pb else t_tien_pb_nt end, t_tien_pb, 0, '', status, datetime0, datetime2, user_id0, user_id2 from @@table where stt_rec = @stt_rec
">
]>

<dir table="cttt39" code="stt_rec" id="PC8" order="ma_dvcs, ngay_ct, so_ct, ma_kh, stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chứng từ thanh toán đầu kỳ cho các hóa đơn" e="Opening AP Vouchers for Invoices"></title>
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
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Nhà cung cấp" e="Supplier"></header>
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
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="Tiền ngoại tệ" e="FC Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tien_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="Đã phân bổ nt" e="FC Allocated Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tien_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" disabled="true">
      <header v="Còn lại nt" e="FC Current Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tien_pb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="Đã phân bổ" e="Allocated Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvDRALLAHvRrTkUjthJ6HzU7ZxMw99PxJI0i4Pc/h3L6Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" disabled="true">
      <header v="Còn lại" e="Current Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 330"/>
      <item value="11001: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11001: [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="1100-: [so_ct].Label, [so_ct]"/>

      <item value="11001: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11001: [tk].Label, [tk], [ten_tk%l]"/>

      <item value="11000: [dien_giai].Label, [dien_giai]"/>
      <item value="11001: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1100-: [t_tien_nt].Label, [t_tien_nt]"/>
      <item value="1100-: [t_tien_pb_nt].Label, [t_tien_pb_nt]"/>
      <item value="1100-: [t_tien_cl_nt].Label, [t_tien_cl_nt]"/>
      <item value="1100-: [ty_gia].Label, [ty_gia]"/>
      <item value="1100-: [t_tien].Label, [t_tien]"/>
      <item value="1100-: [t_tien_pb].Label, [t_tien_pb]"/>
      <item value="1100-: [t_tien_cl].Label, [t_tien_cl]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7C0jxTP8IRVKR6Q8exYwzyhtDHpCEsOZvd6k4lfYBvwkemF2uDXfhHynM6jEZOpSTeo64xDFHWPyYX00tEqYT4LK0vydmIWdJ/En/OEKFG8UA5qcPfEuytmyF3hIn6f9D82KEj3XYFhOq3wF/u5xJP/A==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        &UpdateConflict;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH11YxsTx3IDtgUV5Y5/ZFZNEHy59GjCSUHE+2iQ0NVl48kozayJOxd9ou61L6rXTm3vW4MMRp4z7PmlP/79ZoZtPRJz3Hg8I3+qJ/JuQ392HF+MBX+C2WFimqvfCuChKItr79+SWF8VXsmJAFRvUThNoLEerLDI9tF8c0qIFCBBC7WohD/3cNMCYNmYxCCkNyQhxhQyAH0xDni2r7uSDNjYc858wkqZQKq8zk9ReY66PaA+xWmZnJIwNCT21jArKDN3o5F582P6GNW5vaqAqqJceFRSEcAfLfOB7x0kxucxs7kvLVAUUnslHeE/ooXVSPOn0rZTyF2b+T3PicLi8ifZqA/ssDIEJW80pVv+/ZAXzaNS+XL7eFcx7x7Uj7ld+vBgoBwTvDS7CTyGYwmbVBZKg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwa5DGHgPqVixGAA2iPA9YYgfyTTMgJtGPYQJgrYRafcGwt0Kz1u0MjgrQLdHjJsrLl4UbBaHc+1h0dFIEIShuUgcL3rZNxn/YHfxU3LXgELzlJGs3tI7NSCnFOAcsdZcGkIMIJ4trrovXrpPmBFjB8=</Encrypted>]]>&CommandGetIdentityNumber;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcABCz+CaAX0lpfMh9FbWFFi/6uht7CJ/kwhCgTHCRNcRyGPS9Wnk30HESNc1pSwKqwCy/MMkQvH/FEDialg2i/QsbH0hdZWnCDRi2n5iW8ERM+lyy2A148PsPjruDpl//MEPum9z9WUtwOJ7pkypkqo=</Encrypted>]]>
      </text>
    </command>
    <command event="Inserted">
      <text>
        &Post;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIqJooHwZPI80Wmvmq/1Zncywir/jO1KZHjku3hLM1jviUCbwc+kldqJPsUG9C0t/w==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHMbfxGR/Opo76rCRmYWK9j8s8lSDvRpaEmSn4kWGDrUKbtAXUicpO2UYwU7mPJpAaFHxDPhXrlp0Jflei2AT3ZokWTXhFnDp0hDdJqthgV+sAg4YyXV76UcCjCeCyfFbPqJaKn53/r4nNMy4+pGMvloLFJuX5QttJu4Bs90jGEpYQYz0RC8/bDqHaThW9gqCGBZsNoarEp8OK98Y3rslQ14UCfbZQ/O+gGtRQmifJKaNchLFY5kj/EjmukttmY65c65xyqhlRwPfYyD2puEDRc=</Encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&PB8qTHa8d9eCLB+l9TRcuOQ2XDJ517uPuQbGZK+Zliu5UVJBh2RoluFn6OuQGJ9Rp8pWGd3wCJGMOrWAgR3Bf1Ssb6Dh0r1V3Dr2VFbUnLOg1rPmQAiWFjrRPzR4wqiN</Encrypted>]]>
        &Post;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &GetUnitCode;
        &CommandWhenBalanceBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6K/NxMej34l5DwSGBQV7zdROz3VTkiXOHi+FQW/+sFdSSvGgk6Y7DiCkUAt6gXItXMSawDfzZsRjRjdZH1u9ZOwMb+1xjhFergiFjgw/2i4ToBSROEd5lobmOA4XyQQ7q5x5shgO9r2M9yWFg7SW0d</Encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtW/O2L6FozK0mC8DTvvZ+dmNTgUBhs3FPl1S0ogwCoEWmcNpo20LlacVhx/W1V9vICeirKQcoIyj2Lwv++1gtY837mdDYuC15DmTelailpX9cwawD72jY5M5w4aWXEx6EOkL173BoekUbtpxR6/pvKMPyyh4+C5NVxYUrXNdanWJaXjWJoDrwf+yBT63kzfv6VNCIVPmLKawsSZBPl5WhpwDVCWAWHCyII7tf0z8C1Wke9FHOIxPwCvcsTrzQn77BeZK0d8cSG1hP2rxBmggDUcZtID3KLJq8RA4WX0qtPIjZKPI+t72/+qkta9DYzyjIaRNw5Tz+yN539rJECagGbew4oVLITY2CvTzWean8n1SWBcGtg/sbouykyD+6NpBrjQYJxbVebtAvA20afWM044Hbt916Ia7yGN85/HC74IDHOTFYhPdH6Qt/CEAEEgXTwzxeffv4nwL7NJ2EZiInEusb/iR0Ie90CEc8oAa3aGBrcGpe8nV2hs7/4Mmke6ON7y9ghBeoY0k0yUIdjyE5A6YtJcBxAtBLVMFCYhLCuw77rb0pm1Ax0BWaQbC2sOqkQY8OVIXp1jfeGry76kEXcuE5DJU9XoxlkZfZq/i1au2wfBuBbblQ085yXX/chtSIDtFVWBLCIDH0GOeYCcSwz1ZGAKzS/1ibzSNbeZygYp9xukc0wy+En+SQ2UqsY0uZ406CtfwyrFo9vgw+93Pike7rabB70igFMiscRGdsPgsWiVUfxx4AKkHCshx34wsKbIkyIynHqvVquVYaFuefMFdrzbCxdvJ/5grZ1v42r1B/uzvGuiAhsk0lK30ABWwrj8RkrqMFwrpT0sqnB/IllRdGUIykM52L3P1Fk2/bUn13CJn3JTfC1mVkcoKvkFTWmrqLTuowvWJ55IDkHP5SUUtIwWpLrMPo7Bhjju0vF60HvNkrhsA7tj4B/jCmyskabsPZ00qXSktb7cELjrHTGJDqJYHgAy7pQWr6xOuFA2P4WNtq1hEvSfIQBrJ9Z5vbwsd2ciKVk7L24WAvk63yGwiC5sa+Oav7ItQJQQgiC5nt8lRJq8iLddQhPB1XIXTM/zKflWHh5beg+EabWcH6k1zyhgorfBqQAbgeeRkEAtQv2tw8tU3EU6HySxkH94vng==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqaxtk81KWB7g2dSY6ulSogGgqkFCOD3dEnjzKjXsGEmYG5S+552kefzC+tueOKgBUF49t2h7m75EoHGeon9JeZ6s2YYgYfRoQt3kJ582iVCRc7+zIRAC2EASjEf1gtXg1muB61s2pOPepQELrBSTOKN3UD9Oun4Y46vnWxkTWu++hc87Gmhl/uIacdXTFaHtnQ</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>