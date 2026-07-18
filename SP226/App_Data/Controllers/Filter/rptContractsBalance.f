<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % ContractBalanceCustomer SYSTEM "..\Include\ContractBalanceCustomer.ent">
  %ContractBalanceCustomer;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" normal="true" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
      <clientScript>&ContractBalanceAccountClientScript;</clientScript>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"/>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_hd">
      <header v="Mã hợp đồng" e="Contract Code"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_hd1" categoryIndex="1">
      <header v="Nhóm hợp đồng" e="Contract Group"></header>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_hd2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_hd3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ContractGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    &ContractBalanceCustomerFilterField;

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="sx_theo" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="0 - Mã hợp đồng, 1 - Tên hợp đồng" e="0 - Contract Code, 1 - Contract Name"></footer>
      <items style="Mask"/>
    </field>

  </fields>
  <views>
    <view id="Dir" height="137">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110: [ngay].Label, [ngay]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11011: [nh_hd1].Label, [nh_hd1], [nh_hd2], [nh_hd3]"/>
      <item value="111000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>

      &ContractBalanceCustomerFilterView;

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUn2zLNJ1bxbgb8dK2dgxJMzzd55WhA+mUU4TOMAzC0n2cnY4/MkgG+Iw4nCxwLXf694EkNnnmZaPBeF07fanuD9+ZZ+2HHXJgPQ4mYLMhjVXf/yr49tmu03CiYqk0/Y/o9W1HfBaxAwvP3FWcgd5eG+mA4eVvn7lY4AG/bLTdiH9ZYOicmxq+LKvtzwcyw9BDPghl/gAfbgpD3sLl00yYV791LuXptRn2RaVCtkyLIYmlQRmdByDetC9AfTEvLN5UZ</Encrypted>]]>&CustomerGroup;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0yxPtGAejyllq04+BCQtmUYKPdKT9GqeNqXbKC2wy3+kVHRh6A9K0FS/Sr4+fCOrFQ==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDye4oi1v6IyH84gkaCuYc68w4RNplYtKHwNViV+ROdD5DhVLD15DHmFZndLhWETYvTg=</Encrypted>]]>&ContractBalanceAccountLoadScript;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RHYxqdRJiHSynSMaC/Oma4Ls0sMNCmV5Dvk98jO5BTjiJWyunNlnWEAvXSAmtfRJmHADzxdcECNUlJx26YQzGUE0R/ur6JAGvJQ3K7WVrQiAZ048JufcvWRIL1BTFizvCcs4WpXw1reLf8BChkiLg4sA5ss6vtejt7uhkD0fDA7fOhDz9q6QDuusJ8AxTU/aXaRyIVX6+3gY4DClD1sHzCgpvzQLpDAViYlIugsLyBPx42oYyRFLGsHz5UMPuzDXamoQmgzoQdlBE99RM25o2Ai2fGVXwjp9kHekA2Kb881fRVFZRmLlxxrubkbv5lJdFLgoQRS9klRokZIDHnfg8V3Lh66EOyx42grTHcgihTf+5A2cyOw2cHapkHAJAVjqlbDxssAlzt8ae3Jo+we7oY=</Encrypted>]]>
      &ContractBalanceAccountCheckingScript;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Wr7KSpkCOlMGCF7Q3DURS1Ty0+pDOZfpYL6fAqz8EqGOgTsIMVMarpSH7md8pVxsHSRvAFzKbaTxsH1FTJTq0uIklGUy2lQxEG0/KEGF/VO3MyrUEv0fyTQAWZLkXINsf7+EdmIPGxhh1eOhUKqqcmTvA0mPfHTb2BJqCwZ4ENHViCW45Gdfx5IlNQKQKwUZbR9ebRd3G1+D1adMHHpBhSQ1wQVsetfrHpDzUiJjQk2RWNW2XqQoeRQuUJypAT9E6c6KpCxCPrm9ueWdmJxLR2xid0mNfl707/ic5V47wH3aedZD/a9Sp4+/VVH8j+xILAXSUYV7V+vYZnULB2mcZHnVpNp30oxqrxmNw/Xr4g5/Y7I+uAXTj4ynGlEHpPAGncKzy394Ye28ppCdNeMg5C+CqW65PLgzjBZG12ckU5J5pOhcwfKyfxP/TaYgjAB7wsvHesnXysuUQNs6goVNUOhXr+lsrJlx+YXLVCStHokW7sFGwrWyyIKeMBe6npkoec3EQLTUrT4fonnrxthIMoQPz3kZfNbOSlQ1I+JeaYl1IRVYfe9+j8kWI43hkWa4wZB5zypwmkbD4ikWRzfGIq2yjUU6soMlxVMokv5oGpG5Ewa3PJXsc6ek0heK1kWkUBSyWZa+wIMk/ZtadUqR5T2FxwjcUxMMuwJdaWJm7iJ</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>

    &ContractBalanceCustomerResponse;
  </response>

  &OutlineCss;
</dir>