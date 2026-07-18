<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identification "Account">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ParentAccountMessage "
select 'tk_me' as field, replace(@$parentAccount$Conflict, '$s', rtrim(@tk_me)) as message
return">

  <!ENTITY % CheckDir SYSTEM "..\Include\CheckDir.ent">
  %CheckDir;
  <!ENTITY CheckDirParameterParentAccount "'Account', @tk_me">
  <!ENTITY CheckDirQueryParentAccount "
    &ParentAccountMessage;">
  <!ENTITY CheckDirParameterUpdating "'Account', $tk.OldValue">
  <!ENTITY CheckDirQueryUpdating "
    select @message as message
    return">
  <!ENTITY CheckDirParameterDeleting "'Account', @tk">
  <!ENTITY CheckDirQueryDeleting "
    select @message as message
    return">

  <!ENTITY AccountBalanceFields "abs(du_no_nt00) + abs(du_co_nt00) + abs(du_no00) + abs(du_co00) + abs(du_no_nt1) + abs(du_co_nt1) + abs(du_no1) + abs(du_co1)">
  <!ENTITY CheckParentAccount "
if @tk_me &lt;&gt; '' begin
  if exists(select 1 from cdtk where tk = @tk_me and &AccountBalanceFields; > 0) begin &ParentAccountMessage; end
  if exists(select 1 from ct00 where tk = @tk_me) begin &ParentAccountMessage; end
  &CheckDirProcessParentAccount;
end">
  <!ENTITY CheckARAPAccount "
if not exists(select 1 from options where name = 'm_tk_cn_list' and dbo.ff_Inlist(@tk, rtrim(val)) = @tk_cn) begin
  select 'tk_cn' as field, @$whenARAPCheckFail as message
  return
end">

  <!ENTITY CheckChildAccountAndParentAccount "
if exists(select 1 from options where name = 'm_tk_long_yn' and val = '1') begin
  if (@tk_me &lt;&gt; '' and charindex(rtrim(@tk_me), rtrim(@tk)) &lt;&gt; 1) begin
    select 'tk' as field, @$childAccount$Conflict as message
    return
  end
end">
  <!ENTITY UpdateParentAccountType "
if @loai_tk = 1 update dmtk set loai_tk = 0 where tk = @tk_me">

  <!ENTITY RevertAccountBalance "
if @tk_me &lt;&gt; '' delete cdtk where tk = @tk_me and &AccountBalanceFields; = 0">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Account;
  %Control.Unit.Ignore;

  <!ENTITY c "AccountUnitDetail">
  <!ENTITY h1 "566">
  <!ENTITY h2 "150">
  <!ENTITY k "tk">
  <!ENTITY i "8">
  <!ENTITY Tag "dmtk">
]>

<dir table="dmtk" code="tk" order="tk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tài khoản" e="Account"></title>
  <fields>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="&ClientDefault;" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tk" clientDefault="&ClientDefault;" allowNulls="false">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
    <field name="ten_tk2" clientDefault="&ClientDefault;">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_ngan" categoryIndex="&GeneralCategoryIndex;">
      <header v="Tên ngắn" e="Short Name"></header>
    </field>
    <field name="ten_ngan2" categoryIndex="&GeneralCategoryIndex;">
      <header v="Tên ngắn khác" e="Other Short Name"></header>
    </field>
    <field name="tk_me" clientDefault="Default" categoryIndex="&GeneralCategoryIndex;">
      <header v="Tài khoản mẹ" e="Parent Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_me%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_me%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''" categoryIndex="&GeneralCategoryIndex;">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" categoryIndex="&GeneralCategoryIndex;">
      <header v="Mã nt" e="Currency"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99JvEjyiBz/MOepdWLuaXVBTjVxPMsrfTqcEDK2SVXnBz</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQulJvMM8h6WeHJymnLjMjAyI=</Encrypted>]]></clientScript>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''" categoryIndex="&GeneralCategoryIndex;">
      <header v="" e=""></header>
    </field>
    <field name="tk_cn" type="Byte" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right" categoryIndex="&GeneralCategoryIndex;">
      <header v="Tk theo dõi công nợ" e="AR/AP Account"></header>
      <footer v="1 - Theo dõi công nợ, 0 - Không theo dõi công nợ" e="1 - AR/AP Account, 0 - Non AR/AP Account"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_sc" type="Byte" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right" categoryIndex="&GeneralCategoryIndex;">
      <header v="Tài khoản sổ cái" e="GL Account"></header>
      <footer v="1 - Tk sổ cái, 0 - Không phải tài khoản sổ cái" e="1 - G/L Account, 0 - Non G/L Account"></footer>
      <items style="Mask"/>
    </field>
    <field name="nh_tk0" categoryIndex="&GeneralCategoryIndex;">
      <header v="Loại tài khoản" e="Account Type"></header>
      <items style="AutoComplete" controller="AccountType" reference="ten_nh_tk0%l" key="status = '1'" check="1=1" information="ma_nh$dmnhtk0.ten_nh%l"/>
    </field>
    <field name="ten_nh_tk0%l" readOnly="true" external="true" defaultValue="''" categoryIndex="&GeneralCategoryIndex;">
      <header v="" e=""></header>
    </field>
    <field name="nh_tk2" categoryIndex="&GeneralCategoryIndex;">
      <header v="Nhóm tài khoản" e="Account Group"></header>
      <items style="AutoComplete" controller="AccountGroup" reference="ten_nh_tk2%l" key="loai_nh = 2 AND status = '1'" check="loai_nh = 2" information="ma_nh$dmnhtk.ten_nh%l"/>
    </field>
    <field name="ten_nh_tk2%l" readOnly="true" external="true" defaultValue="''" categoryIndex="&GeneralCategoryIndex;">
      <header v="" e=""></header>
    </field>
    <field name="loai_cl_no" type="Byte" columns="3" categoryIndex="&GeneralCategoryIndex;">
      <header v="Pp tính tggs nợ" e="Debit Ex. Rate Type"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính chênh lệch" e="None"/>
        </item>
        <item value="1">
          <text v="Trung bình tháng" e="Monthly Average"/>
        </item>
        <item value="2">
          <text v="Đích danh" e="Specific"/>
        </item>
        <item value="3">
          <text v="Nhập trước xuất trước" e="FIFO"/>
        </item>
        <item value="4">
          <text v="Trung bình di động" e="Moving Average"/>
        </item>
      </items>
    </field>
    <field name="loai_cl_co" type="Byte" columns="3" categoryIndex="&GeneralCategoryIndex;">
      <header v="Pp tính tggs có" e="Credit Ex. Rate Type"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính chênh lệch" e="None"/>
        </item>
        <item value="1">
          <text v="Trung bình tháng" e="Monthly Average"/>
        </item>
        <item value="2">
          <text v="Đích danh" e="Specific"/>
        </item>
        <item value="3">
          <text v="Nhập trước xuất trước" e="FIFO"/>
        </item>
        <item value="4">
          <text v="Trung bình di động" e="Moving Average"/>
        </item>
      </items>
    </field>

    &UnitFields;

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="&BottomCategoryIndex;">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    &View;
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuynvFHnr3ErYMqXn8h5rm3jw30UsdDVg/hQBfMoTl6aSCFsLvo+oZ2v/L353NWFkTc89nS6a9hrhW1sxBeesiUU+fHTkTjNtCWsbo27iB5CszT/tcquQPBdEtU8QYTUh2UlRC0Obb1oMTD5k0YTmhL0QeylRMP6QudCEQONE8cD7RYLFQfahOgWP2quy+JyolKonoIUsNty+QP2VJe2uiJvae9Z+F8uwjQjUXF54ETr2</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQumoTXoO+rn+Xcb5i0x3JGnNU9zeKqPWJqDWjcHoJsBBI49foS/xFQR0FxAFdliibd+q5vCuUEn6cTGiWXRxsYudAQG3GaFgTrXmiMpVWARFL+kw1lcE7Mz5HgmjsSGnv30UV+5mfr+UBUa1V4IZELDWv1ZueciV5BLVihKAkfVHD</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBYezWCrEMH1fHatEHfnpcccWVGm6TLZYEBa/dcoP5Us66XqUl/3ky37bV8U60xwUbA3jX/WSer0VBt8fn6uBqM=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF5mr0T/UVRV8DeYOlhchZJmvo72mjeysHt2/0wy9vwP</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQumoTXoO+rn+Xcb5i0x3JGnPmlW7/xilAdwKu/VvMDxqL9XxsSIMAy3v0bStHfKQDx8zYsz9JBD/TQiwOsx99Az8=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq3gnpu4JAx3I299W5wkMBy18eDHWwM/4r5fFTXJoJ648F4ATCaWaY3Ps/pBZX+v6EirqlPlwo1CBRn7p7iX7ilAmoHD3+KDI6444VQa0gU+rCxHTalu9MS6YVOvIGb8uzZLzgiv7bdmJTKbbwa9/8w0V73evh9he92YWtF1qanFO4618gI5bDB56COdN1FG42Mt1Ma/Sk4mHg4HwWoM9RzKgc6oj+lJtIy6/aSXtkjPxeb5f83Rw+Umt/pY+ktoarjKhZO9oLRWHr5fPPexS+Rs4RqqJGXvMPnTaEvu3vQ9AtAC1EyL6zHoQlA4EzVCXr0Kovqei+YXHt3gAIfMhnvMZdGxb2D4E9AT3g5s+g8k523XgVNb9DJQhk+Iiz9lXQ9P/G35YWuKi4BjEZFFsT96p5u0UTSMryczXPmV3yXl5M860YWNx+yK+lxNJVUmOhjvCTSat1rwe8l+as/nlxaqPsDYbkKSp5ZIbX7GmYW3z1gzas42j+nVvBvJHlplb6zNJ3tpXzjTAJ88OTifCgpUdx2qF5LuybpE3JmgUyVsrF5k/2suWR6x6XOaDYlutaaZPR5R7zaByN5v5JHggguxPGmpTpjrxdtYjcOnUmlx2xfixq50JmRBAnNKAtui8NMvbW7RSqOxZ6IWSPmxUBl5j1pDvKvNz9YxKLRug1ZlcmT+BJ4SkMeA6I1L/5X8DXl2w2dpjT/F+lStPeUPjB/v4R0ORTYvLFLnBr5yRgrHixJ7NO7x5/XbSuhzIvAaEpgKM3aQ3H7BRFNMwgaT2P52pJpXctPoAEA+1GNJWSeq9jX0cVCzu351yL4h1e3ySYvsodBXrzXaOU6AHObs6AZ680juIknXgiQKtaz1g93veAYzk0REWl4tPK+GkPnOvig1+C5W/d//fOnRiYzkWDQSynudHT67Gwoz6mDRxqvi6pZIqtYExT2cZSVFlk7w7XJCS9a09V26AJekVV2yXjIAG1auJJ6viqEa6bEDWN9Cdt6TzjZXm35Q4w8dpX6Cxkb5DN34VZPYu52jH3CFy0DmiI5oytUiDsdARWLUZmKcyWIpiWIHgpLd0fFcbldE4ZNTm9TEhTWgmTvfhCA8UVABLxFHJDiJZxOHpgIJIX0wJn9amVglkEawtf0oyKiso0aQxOVCOURAi9GnYZNkUpF5</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckChildAccountAndParentAccount;
        &CheckARAPAccount;
        &CheckParentAccount;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUN/QldY+KieM7uuRJqQ9+sw9Qw6rW99p5GlS8M8NgKJpk1u+74cNdK2m/Qaa60s3TmhmQn7cLIWkS750/RwFZbNbKm19iR+TmQVcun2VKmuwL8P8LdknXygwLn+n8wDNah3/YZlv9lBMzQda0dIxcwrG+zrma+3YOKkm4Ax9bywcHpM8dDoGlILqVTmr5RuBFGSad+CC95OX9MH3sLNrbci2FF5wZMila1/qlQy7/nhZZ49HnTZGiQ5JdzhqyWwk8qzkGapuNvPXZK3s+JsfFJKCv9XPSQkAaBay5msW9X9s=</Encrypted>]]>&UnitBeforeInsert;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYB74MK6vr2F1KE/dz/+QvzDcL2uJJO9Ogl6CL18nBwMxIzCp6ONAm5MXgT9hAm5TDp9gKkHvve57mgmSqrHVI=</Encrypted>]]>
        &UpdateParentAccountType;
        &RevertAccountBalance;
      </text>
    </command>

    <command event="Inserted">
      <text>
        &UnitPostInsert;
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckChildAccountAndParentAccount;
        &CheckARAPAccount;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDW5t8A5xapaCoounbWmS0uZdCE2KD78wq/Y/52wFdSfodr25jTJF+yPnCWnCwQR1EFbeUImVbJLo/R0717w8XMp2B2dMx4+YAvr749SyRwMkqtAYrVXAbhFaN/8hdDJmbXYVb27W6og2GXu7pcUXgpnxj1sESQuW3bF28SlN4RseVegT5S1FVm7GGyDr4SuaEnh6Bg5AGUUxk8+Gvt8fLx1xDbOyhRFdpIrvypBu5OJtYPsiuTg1vl7sZ2ptJijVNURJUkaDjawoq644sRH4XVQVEPNDCqA8sHNf7hRvYQL9HrYvDvHL1E/g890p3+ymVlUuwvYomnI616sVCwh4pilNcx2smLFLMBCv8ckbsCPWkEEQxXdS8rqjHospH2dwQ==</Encrypted>]]>&AccountBalanceFields;<![CDATA[<Encrypted>&oPtrLWZdpZl4gMya+1DSINQVr+TSgej5eG8+I28FxcRUI5J/qBqsOoBDUTGWdePDoPKVRwVVm7H25CaLB4eLnMg7yWtl/j0pvC0QECvS6XO408vWbpQU7kcQm7qHfDamqgklIH4/xDRLrSw3Vp1g3jpdNmGmHUIUAq1Z/DmDD/A=</Encrypted>]]>&CheckDirProcessUpdating;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Z2x1+7zkmPOfB5qY5zguNw4ZYxSr/E95LFmnCE1p+ehtJvImi3EUUaBbfTG+4KjlV29HJlGCPRitCjg1xSgg6x/pgBMWvI54jMJ4wqht3BXTJK1315PRtjZAOhgjC55Ow==</Encrypted>]]>&CheckParentAccount;<![CDATA[<Encrypted>&YeMNTHB29VJsL6IOY8GY3oMIZHfU3zrnqz5meZbypb6Z1s7/aRklFNm+TEAXDAipB80t9dG1Fa4ZIJAHdw7/CP8KhiwBtuuT/242WHmaSnHfKT9WMOKeeQUR23739IZ5LCgrEZ8mD27LRCX0AFWK0a7wwRqW5KEzUiPmmo2ypZNtUZ2KR+nEOXo4rqL3mtSHwFVrtutXG3e/Xt5Rv78puCm0dLp5EronNbYEuvQ/HbZb+BrBjOgbkz+mR31umxm7bdlB5kSL8CeE+CwfYJ0hqk8zQ+x6MdMjLDUiE/H5pRDXcdpxl23BntlHfwXZulPPUeBH2qcH77wpdMyhVMomQOJbWdxoBB+aZECX9Vu+LFxUeFB+1/FPwgV+9UsKW1wX90z9SxBFDP+qa8mB7Nqma0hcpS/y36zdJ10uOTybXMc=</Encrypted>]]>&AccountBalanceFields;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHn4odCiHJUPPucUQAPPcpZc6sgYHzyhABDS8/T+FloNVbPhE3IyhJS2oltmrhUNjWZuP35iszonRuTFP4NoI5EZsB2AJYOmfsZuCXBd64vi9gsqmlBYWDgMv92carjCWZg==</Encrypted>]]>&RevertAccountBalance;<![CDATA[<Encrypted>&YeMNTHB29VJsL6IOY8GY3ukxCWdAoCpiPrjgh+49MY8=</Encrypted>]]>
        &UnitBeforeUpdate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzZLzG1AX8ts9u4f1g41FUzdO84tC75tTHHTje/U+VMKtkHP0i38iKg8aOKfHJTGa9/z1bYupPWX1ptdLHAHwpXrkd8t4OkIxp9qZ3HSKXCF2qI/STR6lIh73I87tBHzX3VBbARZ8f1FxD+P5EvM420DCCW4ImisxotwqXd5Q8kIzMXhXRdUk5YJFGJt1NyVrInyhfgkbqc1UusqPfFVvrA=</Encrypted>]]>
        &UnitPostUpdate;
        &UpdateParentAccountType;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlAn4CacGeJsxM+gSZhfshfd/gHmfaqRhK051L9huijQL5j1RpY0ahuuJ8GG7tWVHvoa2AVUpRqnL9C4C0d5jK/cxBBOHnwjxRYEiVNVrXLqO3sDUiRxTuFU3TBinh7DPDb0rM/s+hobRpIEK9QnM0hzdUDFrOAEabnOtDbWgNzplbf+MiQajMdLWsj8bLT9dmUfU0KMfHbUGX1idRFV5Zxf9GCbpm855FYXT1XNI0CjpGE3ml55dCsofYY/M+bwz4=</Encrypted>]]>&AccountBalanceFields;<![CDATA[<Encrypted>&oPtrLWZdpZl4gMya+1DSICLnrNYVxPxY7qVvlknepfttY7+hKqaeu8aTtMxNj0trR24K0zhMrZlit4vqFTtINY70ZDT0aw0Mno5TmrFsBfQvEb5c+6qb93YTlU/Fl4PRbdX61uXFULPCgEe0dxXGZQ==</Encrypted>]]>&CheckDirProcessDeleting;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMgH095H9TbDeJw+C0Gg/d5DpS9i9iu8yo6ZhJsJr7N9HtLr99NGWZs7J85ASeBY5RJdmPHDnWWCK0AIrqcrRQs9T72pZB3hVKSdDQAoFbmRahgZNBTdGAKuC6Hwhq0Q7ba6czBnNMZirQdq03QoI9dHykvNSpaxWptt/tKtNXilQ9GuFbZTuGdcZ6iqHH10v2D/k9TMhXFiFH9JvatbgTg=</Encrypted>]]>&AccountBalanceFields;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHs8QhK7WmgNa3tKPsCTun3E=</Encrypted>]]>
        &UnitPostDelete;
      </text>
    </command>

    <command event ="Checking">
      <text>
        &UnitCheck;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VbYGAhwaJV2zV4US7c/nl04QCYf6QOlUFMGoNW3GAR/uE0q7FUNN9EW5P+rUgKmBsay+ouK7dq/BNQeiqpM7GIxBMHvqVMuQw+Dq6irj0mR</Encrypted>]]>&ActiveForm;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWylYGwX0SpO8FAnklscuBgNa87WuEZ7U0SM+ABihKYTUBztV4PDpBKmI9EkhKW5hmSfoH+2D0VD4i0MGd8VK4BovHk3FbD9Esq79W4csgQjoPMZqs25ligYr+e+Urk8A3RA==</Encrypted>]]>&CloseForm;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyqw0Vx/mwUps54BeFhEBSa4DG5MgeakYDaHSR5LwQZfUvEsirTFIJfLCBz3mnLtE9nZRExBvFm0lHKi+iY/H70rM44a13eH9Wzf1p3QdcniF3aow2keQyqmAmuBMNilvD6PFdv7qPA8qf2SE+hYBvRkN3iAY+Mu0PlVUUVU6CC7WHiqWa6zJ2Gm0JoS+RhScWWLjQbLRZ0DPA+AbTpi88RVo5/7hQI65+Vob0IEOFXUAQmAL2nXJDhQ37KVNd/tfcB7z87GbBNdayAVcGMN3Teg=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&UsIPRetuUmZO8lZfQU+wO1+bPA6JYXj0axo8f2J6h9AFEI+NROqVvy9NfingTp0i19ObccWW0g+LHm0vAu3r7EHEsRGJQyD5EoOoQ9DZJSArub4/dLuXh5Uig/EoWRrPdk+LGqKvxDxRQbpN66u8pP9WUXJQKS/cdoubp75p578KRbYIIkXntx8c/4ITHvO58aqHZq+OHxONbKsOa5GrExbOId9b+vQLfY7tFbwxrvI=</Encrypted>]]>
      &TabChanged;
      &ScriptIrregular;
    </text>
  </script>

  &OutlineCss;
</dir>