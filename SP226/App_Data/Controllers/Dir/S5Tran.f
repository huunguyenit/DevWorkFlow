<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">

  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">

  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">

  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB55Ok0dgzSdvTliEDQYGpQQ295kPB8ftLmRfiR7s/6OoEzZbLPbhm+hGro6AfukOiHShcBPo4NYJoWImY7DjAf2rL0etvJ3zxzCvX9bXCuwuf+VdNHsvwxTeUyCmyX3sKPHAfnXoW+G5T4MuhQVJ/8E=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB55Ok0dgzSdvTliEDQYGpQSKqS+kKR1fpCXGYQ2CWLU74qwIP/2umdBs9Ko4f/NnSSAXvb4e1IVC3ny0Y+9OuZ87I3/fyrqRi38uIVzG/tKBawKmhDeEx2PG/xJgcan53avMH6AtjA6pJGEQWd7cMoY=FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCzDJ4hGrW1n1qAfE22yvZdBzXoaAhcyauaRFjQEQDdJ1UbzRsFwtAHIsfZ6qewwt0/otfQo8nwBIYQfbeVX76BqHjLJeD6pBlhXTpU0ouULE=FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$ETLr4b7Rzr4OjFrpPLLTZxj1rMAZc1C23YCbzABR4tIfr+ckOr+nfHbfdf0+9PXeFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbicKDjHLGM5Ky9/cOSgFlpivr0/xQHD78BtKK9kCL1fhEiAX8vtPekS34pIu2OB/PhjCx6bfmQ3WqLFhIh1m+WtpAdCxYL/yI1JsnZl4FF7vIFastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9lYRVjt9IBc7Tsc/NFf9HBpmiZzBEWSzBReX0+RF3MHVA==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQNcQVivmzez5l3VM7Qj9AYuBHbhUIu2XAV0OcXlhT4aUG7sXLDm7HnfVfZwKLDg3jA/DBDa9JF2pC5PhnBJV3Ow==FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.S5Tran;
  %Extender.Ignore;
]>

<dir table="ms5$000000" code="stt_rec" order="ngay_ct, so_ct" id="SF5" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu duyệt chất lượng" e="QA Transaction"></title>
  <partition table="cs5$000000" prime="ms5$" inquiry="is5$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="07">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" allowContain="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_nc" allowNulls="false">
      <header v="Người vận hành" e="Operator"></header>
      <items style="AutoComplete" controller="SFCEmployeeList" reference="ten_nc%l" key="status = '1'" check="1=1" information="ma_nc$sfdmnc.ten_nc%l" row="1"/>
    </field>
    <field name="ten_nc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Create Date"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_ca" allowNulls="false">
      <header v="Mã ca" e="Working Shift"></header>
      <items style="AutoComplete" controller="SFCWorkingShift" reference="ten_ca%l" key="status = '1'" check="1=1" information="ma_ca$sfdmca.ten_ca%l" row="1"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="sl_nc" type="Int32" dataFormatString="##0">
      <header v="Số nhân công" e="No. of Labors"></header>
      <items style="Numeric"/>
    </field>

    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="ds5" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="240" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="S5Detail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Chờ duyệt" e="0. Open"/>
        </item>
        <item value="1">
          <text v="1. Đang duyệt" e="1. Pending"/>
        </item>
        <item value="2">
          <text v="2. Hoàn thành" e="2. Completed"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="300" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0, 0"/>
      <item value="1101000000-101--1: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="1101000000-101--1: [ma_nc].Label, [ma_nc], [ten_nc%l], [ngay_ct].Label, [ngay_ct], [cookie]"/>
      <item value="1101000000-101--1: [ma_ca].Label, [ma_ca], [ten_ca%l], [sl_nc].Label, [sl_nc], [ma_dvcs]"/>
      <item value="1100000000-110---: [ghi_chu].Label, [ghi_chu], [status].Label, [status]"/>

      <item value="1: [ds5]"/>

      &ListView;
      &PostView;

      <item value="-----------10-1: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
          <header v="" e=""/>
        </category>
      </categories>
    </view>

  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3Q4CoEZ57IyDUmPEXtVLpfswCrevdnuM6icrtLWhv09Iu6Q+bpyHYYDPxmBTxr5FPHw8EbAb1EkDWdQQ6PrAjl+mM6hrjyenHf82NvufBahj74K7SMnZUhZBeLkYJfnaxrHXMugO89KFuX0Qadtexyt2ssg079hcQSqg+ygj5ZBbqT71OAo6MWcqFq2lisHMa4qgsGhLU3LDslLRZXa3GGwcFUF3jlT4pLctfRMYA2Ae85rod6c279m9bTbV3q4FQ==</Encrypted>]]>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ioX2dlA71hiUG10e8IUM239+JZQP5HN2LFPKnkQnzziC5Hyz0U2XZdjpFNRx2e2bQTN+nUN9/POu8gnXCQVGNTl5wrpR618hCcKEaV6RigyxFRltEvEEKNn2+c7JsUc/uapsNCUFPDmlyaP8+gd4wSw==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4lu5GhEr7giApi2+Qp31OWZQ0yly4yvcOCbkO04ZUCfKPztzCsefTfl3rF3Nr2s+D47hHI5vBVCWo3N/FICQt/JfYaEzBx2oeHYlhZEpfXJhbtDUrqG7vTPZCgYUJUFv4ZpTAYfo3tk/zQfwN1FokvpuXIkgQoF79lwQBIt8rCx6/ipEwohobEl1UBQ36qL/nnWWjM8x7d4Z2aJTy1OY19Qw1zfMAgokdPkwlPsGAiTd3xepC+S+sXQ3vZ/ImE9kFgXAEqVTqfbScnvUIHRopXTNdUujX6/NAtUdJqUWilLAUiTGgBysIp0RJppi4nKbRtkbSigLyzBEEthQDT7tnxruBUmTOTfLaSi+9yqkUG6rj1XkofsGIL0wG7z94R9rmr6TvR+cmvOezwSvd6kOSVetBcLvgFe+UuhQZLbcFiOXdKUvh2Mn9eXZJUz1zhPYvbd4Opo8tZBmQ2B1WVduxDWue95MdwzM29Q1E4DQejY6tMUmE7BCaQV123x2bYcF25BBblq31gSNRbxNCuD8og+jGiU5SbVWw3LKZnUe7x/FGPRwih19+pGw97nbt2ZHQNjaCiOfh//rWOwiOIe5lfAKY89pzcQPfCffp0hphcggiHy/A7Zep7stX1Cg711yniNJOODNK7EgG7lEnneN30Dq5o7LL0hjB0vzaJ3VauEMbJlIIqD4YHPLq0IsbOMr/ETkcTVtjRDROJtgiJ8IML3cQvTcVLkFjdZB0t00FQ1Ok+FBn4otNFqFYWwBCN1Ig==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1ls3PRHdP2gn8jSiPRSLlxl2n1IvAMj/EqA6Uomzn9f2nXkwuUMF7EQO3Tx5h/cmHMtXRp7UmLEKkxO3JDXsPzxzUJwe2fh/ZhfPwcXZ0m9QR2SEIErlBwX7Muql30I8XQ1xXruVCjAm2z1KmMoAZNtzcVHVjm9qJkJrIRB3NIPb3Wx6wE7Env1sb0CO4CTtZcomVjj0rf4vkB36blBYhUlZHcwRQPDVPo86hmcvQzWQ90MJF4IXhcgUOEbc4+n2jfiLZv7WuHmzccw4FaqcvOLVQgh1g1eljVVaHQNky7n6dWpvYJSjXI6z5keBWNJsg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsllvMgj58ZU4Cbo32nnol6by5rMB7lL2UM+0EELRwmLsM9LYVRghT/swW/RUSzTFe0TVBVxCTs2zPUYJ22XPCMaC6N8Hduu7Vyz35zoOXo+xAqEYNVfUxHrmux8QbdjK5FNPafl0oTUqP+NfNaf5p+1ezPgm4FTFj92FqVihhIgyr4YUsEv9iVhOdfY72Meu7jaw5ZvCvE5TDSan4Jlf3DWlXZHUGgLNZ/NlvLX5ksDb9LPn7WhJ1UQcn3i6WkzcnI01c/wTimKSGkybFVWu/dRkW8YB5XDUPbL6bmu4PPcR5t6JUEQFylkM/BqDIITmQg6UnzTXlO0NysYUaukCUH6Qc6M0ZwOlg7HY4wqyyvTYkSXQif3ujx5RzaDTDAws8CX6ILm/fHKzfmD5+n0+fQCFe9s7Kboo0zhyBOL3A29J1EmZhS96K8Xw0CJ5Qi7OOQ7q/Yqicu9ieN8Vxo9uo7w81LMew+7REwAI1S94i42aKpF8bJbmpP54eir5c1Zune3jcivJ5CH1ltJoHOEBVSqkVKq7f/BXAYTHRkKJ6Ft/m4BEoQdhvYMg9bcnQjuqA6y3hyXwhg2xf/TOUO+udLT6P+466AqL8ZNCnCed9t3XozQRPqR/knFZKM/WxYtZNw/RMKIFxJ09n4fzyER1euQ4lHGZl9ubkYPKoozU9ehx71HGv7haE2WJyRsfFTgeYI=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLF713bBnVs6mlhoo0D0gHVgD8K/oTX+psxU2uYhZ0YL/SUB4mj6EZehjjX6PmYQlxaqtYmBRjoxEa9RwdzcIXM=</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5rykxi1xP8tCTX0t8Ctu4cOsjPaH2SZ/u+e+TIYb8Dac=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx45pA0jYX0PzvVi5OmRi3qNGkGisU6A1QpshkzDT3qd1jQOKOHp5JV2frMjf19uZTSdRdzyY/iWerZxZDX1DIajBabi6O6jngWmOS2DuMtQ9nGJ6o3jAH3D490s0h9kMMxoEu7HDbYMbhcm8x+h7G9hE6qrkr35p+oA51nBOayQM7pPWfF2OrbEei5QG/7kSZceHOzLVyinDvW1HD0OfgdDKmFwxWOl3NIXsr+ouGPq/xzQFB2L906kG7KviZ2wjawQZEF27uYVuaJXZ48hX9GfIV/AQ6kF2oFtW5p3hxlnOAUsyZQsBE9b5ax/j2DR+DYgvrOA/AOVhG1WJmxoWANiMZcEDhrK3oTx3p6VIBkWmjZyyw2JwxMH8XUhLzfLz3x9NIp/TC+SdvGyi8ksqM+ovqoVpB1+pBzBx/k+JoWcCAUP8+9W1mq/LSC13dp+VIZiOQy4ei4aoy08gHJYYq66WCqusB8j/+6oCgks/UlKfzt9k+DIO4ELkDj0a16w488kSeAQFInWMS/6xhTVUi3Gw+x6i8g/uUjopNi6T5Gbux6Z3xQn3KwaEId2WCGfb1VNm/tPhBd7zMjhj9TS0im8f2R5CpYt+NxPPWUCzQjjxWeN6ieVi7x510J3XNriGBaN6ghKBdQPqU//Ht9GIvxIgSDLxtlnbbi2gg2A4lUbKnVzDoYt8lUAX5BcP7tZZVi8e0F4n9E5OX5QSb/vtTZ/</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku+t/ExvNcRoYF+i3Mq1NzPNAVM4S5dU2OIQk10p+RM4QwiJc/kdtlqgcsHx0UTNEaQBDThS9DMSROMHgm9dOAW3L3TIfKSGjJnz9Bk4/mWWr8VI2vic4FM0JipGEADiNQLZ6flZuX/oiS55MwZb2cI05dXIODXYi0eRR5jKPqoqV9bwHVrizpuWZelJcJF9ieo4d0v8zXWC/mn1+NbgUoaQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QfZcusEDUtJg79kCdC1g1FYn8a4SqOhI6F+lgPJRpbKltToVq8xJlSwWOBhjgkTXq1NygOmUOWPMOTtzKxxqbNdkUDUTGm4Twx1uAAMsFpb1O5yeU2SedigxzFUH0BSwVrzvpmSW1UAcv4JbWRe0cy+n7dzXvs0cqZYXQzVJ78BxZ3R00zCPOBfiF3n09j6tUhaQsm9yuYjBTRN7Vbz5xcYkKqjv8SDVzRA6f+kIpsK</Encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;
        &AfterVoucherUpdate;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxA6e0Ok/AkpkZ1vvZpbaZ2A592pc9fwR0xyoFw4hiZ82RgsOXXggClY7DpjLCxxx4N1yrsZkO/N5IZMVoAn3PQ=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &Delete;
        &VoucherLogUpdateStatus;
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4XsIwRRhKWfx9nVhHaj3vGQljD60cW6LmE6fRCeoc9bWvb3pnCowJnZuGrDPXrF48/ClbJr5rttYr8k3LGwfvFT4svU7la1GYsje4zvbJyFKtL0BDmiDzjTJuHwgHs337JfumOpLua4ROUxqvZ6vXWDnyFKkl41bQR+yiBlEWeta7xwKd0scFMGQ7R87bsnsnC8kWk5i686Dlpqt+HFLNz05cWOqHQm3+mxlXfz4L4/PipDzd8IdQm+I0ZIH3snP+YGRJNDivD1fHxmB3eOPJ4i59N1FnL+INOHV/wJVdzyrAIwWXykzf/amnbpL5lL8i4024H6q4EBDt8bWCQChReBO0lcBrmI3W2oKR6Yzz5dAIuxx1PVmlfhqzuSX19E9/4PwvCGGjykOrjPfe02UpyslfRrCpCaT+HozYUD0uJ+SOyH7DyL+iYQ2PRdWGoyonNRbFHAhBjE1obiZHvEa66xNT4/q+NA2r8QfcuDulUoPLyloGbslK9YzvTYiHsAVJAt1DiC2Gxw3P3nhYsTHyx80i2Em3DBDR6LwacPt54dKzIthkJU4SZ1j+eQhbP7NOgJJf5zlBWZ3TqmntCOPtVFFUnZUm8wmxmMKyimZerV1EAwuBOR3kRp3UimAdkbG9lBIy5XG1bQzgSBYnIIVIN9wUfLRCneN2v6e+a+mGeIN</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9xB/zo4hVkN4CJvCfIim4FUjNvabR9Ha442T9AE2AmCul/iR1TGbQDw2OdJXFnfI7uDZHfE58nQ17snohRFeb9DSUSF7b74f6f6T6gMMXaLuAHFr3U6ouiMhhazHkM3Vi/r5cdLCAsNk4kWtorr8DE4DAvdHhqnc7zwuWJ0JlpL1BGM3pt+eW9b/QrcxfXzzEZRo+FkDJ67cHXcYbmxYzLcSnJHBxU++rLdDqQ5XTvMyM/NQQcDlNifD+zJzepnZXV3qt3PM0+RMnqMFwg8RbFA==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cJBEXG7+jAvci1Jt354JH328nsiAkCDvew5GL57DsilgQdnwR0A3vVad4q6bqAUrFDEo0XcyyPG8K3HvySRv9mcNfw3EbeHTVSv5SN2txA6+ag296u/FRJatJxlUBZXW68skXLaca6XBbNMKwStmZIrF3HJyD0PSQUPWXwdUn+l8ZBnXXBLP5axFhDhO77fa7lTtpIp+2rtOJFL0lD85+BA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezCUhteFQuF2jyXodsWwt47IpsWL8j57IGWxpnIiH3mXFiznCvpAPKZwM5R7B/zevmU38K3hYIwaAIQ7SO3g7tnCZpaRfDhMEpKadwPu1x+fw4kDujxSPymeZ+gdHlP3TUvIBBQTpy8UgNhSzWS9F2cHBPiODEYf4q5GHzMkoXP5YiHBmCSLnqMkMmGS5fKCQd</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+412oWvhH4jvXuUVFXIhMRVJcdO26SRO7VINAssS3FPQ3XBpZf8AAse56PJYdv/Aqzw==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxpCQIczZQQCxY95rZRYLk3rFEbR2HaMR0BefP3VIuTdkPpv9rWIeQQOv1ohW9Grpq</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUanxIwn3ThRgPm95i50JRDHnGmNkN6F8Zn+coLELFEW9YuIhKI6Bj7WHfxFzJklR8hSTGmK2Izq0bHECf13UKBdD2sFv4JHqZOHcNW1inydM2UBM90jxBtMvyz0SkLKS/3wuODt2/qRIZqmkaRu7Poz9tAWgA4+WfWiXwCstorpfjoJQ89snwAoaaXH4TVXSLNGJKuHPdh7hfsUHbAz6MQBH2xBoFLYdxpW67+9OgVE1dUD3mSMDqhe3FEjsbAGPin</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgmAexscGIb6XmMXc+/kA9N1Nxy9w7CZRaggCOPybbNWg==</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ar5f79axIAeYkY49+CUAjG4pjQ27Y9E8daJPUvVNQA3Kadgw9PlpDiyxKgHk8tCYbvEi3xCzlGQYMAlUTO1GUfhBQ+vZkb8uv+EX4AQs0LraMkhVknTQ4ORrURnbo4vGwVZPzHI9z7FEp26Sn1Fl0XOQhYdx81wsRvzKPdaSIjFo/lJSSs+bLTJoRDe1BSDR7LiFYjO88OjW3Aywtn/bVnJgjrzrOFbXaJzlzR5+lc1</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzgPI6G//d3xSgrfyqkXgpMAUI94BfGWqMAzATWVXhCogOkITnUl+wQ/s07h/M9Sf6FbwKbNm0CHMk3Fy1wY2KUu</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgsFl8HoQVorcRgeF0bdhsS97080sNhcM9CxDoXWWjYLq3Ipwlt8/4xMGbmcDxahhbL1OAVBNN/Eu9MskohDi5Og==</Encrypted>]]>
      </text>
    </action>

    <action id="GetVoucherNumber">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5nl147b+zDhVLIuMv6gJKk/1RXaelxAkPJFfCxhcJJS+bmoInaMaXGfeaDg1SAgAvEH5tR/57UPAx7DcnnYdM3zq/3PWK5wOYAGOcXj1wwKGuuUDgD8kqrBRY906Aw+9ykj9zXm4YWbkIhXgq9FEON</Encrypted>]]>
      </text>
    </action>

    &ListTicket;

  </response>

</dir>