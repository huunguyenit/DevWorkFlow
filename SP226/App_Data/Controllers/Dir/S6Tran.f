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

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpClyjhFXnc0mGjRimTu4LSms+0MhP2SaQY3eLGY5XmNjrS7qwBSstlUqiyTYuSbCsopDMnWh+621fmZ7VO4jjKwgHx7wYnFIkVLtgK3ZITEPA=FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB0B/0RrDrJlQGaGhV6tqW4fcNmVRsAz4AT0NQiTSdRX1n+o1D3ra9KzMjy/amvB41wehxDTvztMz42NNnGZn6Oo=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9lYRVjt9IBc7Tsc/NFf9HBpmiZzBEWSzBReX0+RF3MHVA==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQA0us9kGRGi0p1At9Rxz5Vz9sH2+LWmO4aoz5R7fJqvcgqApqLwrJI7RxqvVgi2kPkdQqaMAw9mAaZnm87SZuEw==FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.S6Tran;
  %Extender.Ignore;
]>

<dir table="ms6$000000" code="stt_rec" order="ngay_ct, so_ct" id="SF6" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giao dịch máy" e="Machine Transaction"></title>
  <partition table="cs6$000000" prime="ms6$" inquiry="is6$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="01">
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
      <items style="AutoComplete" controller="SFCEmployeeList" reference="ten_nc%l" key="status = '1'" check="1=1" information="ma_nc$sfdmnc.ten_nc%l"/>
    </field>
    <field name="ten_nc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_px" allowNulls="false">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_lsx" allowNulls="false">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status in ('2', '3', '4')" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status in ('2', '3', '4')" information="ma_lsx$vcs2.ten_lsx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6WLdGPbR/otplGt+tDMb53FAzwHcjqdUubshf5dMOz8A==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_cd" allowNulls="false">
      <header v="Công đoạn" e="Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd%l" key="ma_lsx = '{$%c[ma_lsx]}' and ma_lo_trinh = '{$%c[ma_lo_trinh]}'" check="ma_lsx = '{$%c[ma_lsx]}' and ma_lo_trinh = '{$%c[ma_lo_trinh]}'" information="ma_cd$vsfctwo.ten_cd%l"/>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
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
      <items style="AutoComplete" controller="SFCWorkingShift" reference="ten_ca%l" key="status = '1'" check="1=1" information="ma_ca$sfdmca.ten_ca%l"/>
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

    <field name="ds6" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="235" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Máy" e="Machine"></label >
      <items style="Grid" controller="S6Detail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="status" hidden="true" readOnly="true" clientDefault="Default" defaultValue="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo_trinh" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="295" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0, 0"/>
      <item value="1101000000-101--1: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="1101000000-101--1: [ma_nc].Label, [ma_nc], [ten_nc%l], [ngay_ct].Label, [ngay_ct], [cookie]"/>
      <item value="1101000000-101-11: [ma_px].Label, [ma_px], [ten_px%l], [ma_ca].Label, [ma_ca], [ten_ca%l], [ma_dvcs]"/>
      <item value="1101000000-101--1: [ma_lsx].Label, [ma_lsx], [ten_lsx%l], [sl_nc].Label, [sl_nc], [status]"/>
      <item value="1101000000------1: [ma_cd].Label, [ma_cd], [ten_cd%l], [ma_lo_trinh]"/>
      <item value="1100000000-------: [ghi_chu].Label, [ghi_chu]"/>

      <item value="1: [ds6]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Máy" e="Machine"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4lu5GhEr7giApi2+Qp31OWZQ0yly4yvcOCbkO04ZUCfKPztzCsefTfl3rF3Nr2s+D+syGK0b0ZL9HWOmLYbJ5RGZyGAjTwOJr/CoXTUNsCEmN2OGXXfGfUFWHIaRF3Ndp02JgqJUqTSH3mNH4Q8UUmUBh/M+HH0ovWlvcmY9KdfemOTUKfawqYMkesX3AiwiuuCDdlZvPW2WEG61cIUeqsnRhpbhJnF1/Trgc7ZiJcg0lZduUaEURwdvqjkhuoi82hv8BXUoX/qvAYxYmaYTQjRs5ztz1Y6oluPUeOhEPoK63e375bFajC9Q3ZwVQa64vl5XPh2JLwGEMsrD54HUUYkhjFvzLkQZL30sH1daGKeXZDlMMBFzMozFQyqbovwJNEGAkEsQh2cYj+b6/kkHr0eA2BGp4u/sQWdFOTPeVcj4ficOf84HYPYklxM/C6QN0FDaxP4qAOK5oIp1C71HfRb4gI3TVWSKmownERnq3y2kw3wkKFaKIIbA8jehYeaXEKRLpfUGBpGLv2XzhpmOfuMbNQEGoWc9Xt1+yN1TzXTJIPftIhYXdmo3TR4195dsgo29YiPuQ3xVMpcx55B0dhqX2+p9qtWBqYivhUuYAV9fkMi8593QGIQTk9zTKAyJLu7/DIYps7mrpU83DsMldToNXAX6RwDhhpyR774kViXS8IicsSQsON773l18BkSXogXX+xhVteu/BkETsO/TYJ8fyA6QGOyQhmp7QDDSWYkarAaEF+lNrNvkrCj4k9Ng4cZJC3wYiMgFd6sKMyOqrdEOrIJGPlG/wi8fZ/80474/KYGgdESrARAoZh4s1lDQYk9i6ydaGlauR5xUTOK1unWzx3+mlFyw+4p9xlfFWzx8DKXdeCEQ2KWfWkfREg4VFwwThQQUP3p/Xc+jXvX/qzMvq1SZzaoT9vCsPec+nLBO5x41xFi55cDU7V8UW49eA==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIHVPyuloQsM9S3+zjeFCNMDe5YrcHfrKjEJ4CK7E4UZO3U26xyTB5Lz5AuhD0EQEbwE5Xv+t5WljQOR/djGK/SxqB625mxa2hT+GEGH5N4WEeLOgEz4Eo2V4mUaNGoiecUFELM4yRadRgV1efCxLm8FQKZRvTzmSzHvR6iuUYig/U/mCtnvp+cqpsdy7GzLcXIr7rVcIbbCIpb7sfRD4rYGCoLTNzsBHPG0LX9hkzmLnVKCJ0ptWp6bB9G8SaIlvg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMUJ7gk58MRkg2OMJiRxaEwd7pobuM8VcJUA2bVLxiKHNsKYphKwPSqQS2dKyz4H/DNcBFrqcCAG38mV0nj0PQo=</Encrypted>]]>
        &AfterUpdate;
        &Post;
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
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku0enOfFDmXSAjX3R1FUhIuxTD6N2HNZfQAu0glRo3Z7wEIszXmL2g+DdG//mCemm6aL280qemib4h+5nd0kqeEOx4Ngf5M/ThFEZLFdg+RNTcBRD5vUIf0Un26r7drQ1uQUpvaMoW8p3bgP9+qmoZdUQMexYHvYIjGBQg1eOCosxxmcsLXMJk8cc7viDy4pYKPy+PRk5BUi8SN616zi5Q+e9iJ1ZXFkwCyp683sgu/1tLzpHr+//dlVA/AJOivrMaw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VcodcSog1Il5O/nSSxE99B6cJVbIgrhXkDtpT9Komq5d47pC7e/AEq8uH+Bi20SaAae9i6XUXgE67AwEKmZOmPPUAPYjlKUZXEMID0hp+4riMG5aMZGfIeXXIaRxCJvtWNffsc0pCt6q132f6jkFv9XP9xQMEvaqWVzYiMj2vaLENZewZOEIlfUH2kV03VTWXrleUgK3nPrM6tynvfOHNENOoN/EiumNsxoDFNamiNG</Encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0Ibq0rRaYinkjiZUHRP/f1/y79ujXjTj9wTn/bzi7Vea</Encrypted>]]>
        &Delete;
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9orEXxpF3vCfO9S6eaQyNBL7IO+E57ZDCPIvuJnZnvQspjJwLD4xdGHEtMniqhSPeUyqoHmxel9+zgo6ZvDkrK9Jm1t7KhOJh/ogFdlMSDxVfiu4YhPtzz2u8tM4MpMucTeghP8ThBnH/ddlAC/gNpE0Ky8FhnD8CPhBvcBoEJS7O5/tXGgwwGgK6KxGiCwjrLFzWPnazLFf4foCWjquiRi0+Y1IY0WV7YJSFrBzfQYcCMmtRKdv39GupaXSkCOxdlhLDWYpr+Fkm/iON33wfSRw8jtEG/+HJXDo+isqiH6IahMsU7J/sCQixbltb7YC8Votl+/yE/QPmkerl/knz8g==</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJhES0jT/2KnkfaSc50Zxd5ZZwJh+QxE9fQC5RWXH2V+bKaNBPz8kR26i+ncOs9Px/WgzVslywWXc5m99zyZZCvvasEhJm5ovBLyDCOPqKlzTZ4C9fBR21jW9xIx64qpa5Dc56sV+FsIE6HZCBvPK0EMak9/tGcJHIWvU5tLEOx4zFoZs4NRfUdqjzuyI7bDNLk2eU58Cus7mrPLkSdD6dcqZBheBpuEo8tWKByyKyzwzHdi2c7hMzti9fAlbPMJgBZjQw+dobJdfVfNSOhEpVXg==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezLqoNVsiINCZ+7Pd5YCZmSVGfMqbg0WNLAGjewS29gcBoE61ZtYFWPwtJhfHEyROVghfC3Fr2HeK2O+ahtU9Ly7UdyIBHdJc0GGwB3ygrRquL66NmCbHdYfxCgHhBzlqfKFlyO8keJsG7ubcRCDpui8fswizzIlAybS9nYmHFxgS1v2BLZP0zASkU59uxLKNBOaqSDh3zXwsZFp9tCTOk+wiycndpZ9HTKfcGt1jBxn0=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+412oWvhH4jvXuUVFXIhMRVJcdO26SRO7VINAssS3FPQ3XBpZf8AAse56PJYdv/Aqzw==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxpCQIczZQQCxY95rZRYLk3kGrr//qOg3QS8ApApM5Y3WNpo5PAiFbH2f7xC4oaFH0</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUanxIwn3ThRgPm95i50JRDHnGmNkN6F8Zn+coLELFEW9YuIhKI6Bj7WHfxFzJklR8hSTGmK2Izq0bHECf13UKBdOVhCyAFAx1pBCLRx/lMQGckrNkkOudqnLO6PnP+I+6deMpLlYxuTlYvhyHMYmG0XRG9ayk51ny5fOv6WKjR8Lobv1Aao6LJpbR5evdjCNRoifCQ0F/3Bt9Rg2tY5QgPSIx/Wp0+/nxSf5HDocmBokGZC2CdSWQCjGqo657sV0kDhWbrHBWd+m5KzwRL5CnbrV3BL48iCxzYldvh3MGSsLNAJXER+Ey83VtBKDeWOUWLyAJFTOBgnOPAAW/u9sFsAI8SHdwTIEbKhRmMfIWNCDTjctna0hwGnpQjdZQg/nppCo1vBS80s+kWbA/ubQyQdcjjKePgsCTj1l5vV3lDhmZCIrNOiMCGgza45h5vQu48PjXZr0DYWxKQwxn22ROCBLZV7SWLWZhDXFHFtbGRoaDTRV1i5xV/pliraWRzk/4fHli3eOVN79P4bqC8WBzU5jvBCq06oxpo7ZbJ6OvodTX9nB63aQ2oWLDtYzu4Bgy49gEzFXCl94wfgGiCm0eBzl05Xc0jGfEvnSE/RoaUOIdkDrca3yK78L15AfUhOFbFfAOh7Q2I/wQ4gF/Z1dlVTg==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkj+f7Zs9AHVzl4l5vw5Y0wCVpvfxKE34IKSi5b5fh8aoJpl5jiaZs9EYtOtlGm2D66GfeDjKNHDrVGbl8izJi6J</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ar5f79axIAeYkY49+CUAjG4pjQ27Y9E8daJPUvVNQA3Kadgw9PlpDiyxKgHk8tCYbvEi3xCzlGQYMAlUTO1GUfhBQ+vZkb8uv+EX4AQs0LraMkhVknTQ4ORrURnbo4vGwVZPzHI9z7FEp26Sn1Fl0XOQhYdx81wsRvzKPdaSIjFo/lJSSs+bLTJoRDe1BSDRy4Sc3Yfg7r+9tjusraxQ4pvyML8M99edZmJJ3m1z+2vdX70eKewEQB68pRJl96IN7rbEHGh3dtPtDwWjWYkXNLD5sY7JPxHMWXtJ0uO6n+BmAYdKgVO1ZsLpCh95+bjsEWe21vJqAYtviCI/rNjqBkiIZBJkCHlggcqCtYnjxDC</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzgPI6G//d3xSgrfyqkXgpMAUI94BfGWqMAzATWVXhCogOkITnUl+wQ/s07h/M9Sf6FnCJ3KVtphAxu2pQtH1KISZQ49DSIdN1b5cWcy4K/tmu/oLPjQnNL/O/9z0mGiHTk=</Encrypted>]]>
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

    <action id="WorkOrder">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6/tTx188Qyy/no5PlbKbKhzfYavW7fchIcjsSQTAeNkIc8FAdGbnNhADHpn11B3wdlqXFgSHmdwHMOnwKsqxIaP03KuxumFYNbYd5xr2HZERk8lfKPVehj2mm2sB+ZgWc=</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgiHcZ2SYgtC7XXT9H4Qcr1woB6LsFpLrf+WQgKWin67tFttsZ+iIIqz+oJEllDWyU5RhIyPQTETPDJZFd2q53Ig==</Encrypted>]]>
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