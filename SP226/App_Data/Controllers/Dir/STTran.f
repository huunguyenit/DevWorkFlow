<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetContactInfo SYSTEM "..\Include\XML\GetContactInfo.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY XMLWhenInitExternalVoucherNumber SYSTEM "..\Include\XML\WhenInitExternalVoucherNumber.xml">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckClosingDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5On8HA6K3EA+PM4nmEBHHL/TNENxjRhTwt3IvO0B8hfcTo+YPEuv8ECeH5TZ7rHFdk/nZkfZfdO0QvcKgDUdg5TU0jcK7Rg1Wp89yjvrIFj5Gm2H+f8RVxjF2Mxyj/+sjpk=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5OlHm/H8WdwPngw8+9BvmK5d1SklszPTMvAXXu3rl6w5sbXD4CLQsWq/WyXvC7Rm6qGzo+5z6gdR+ngKw8kn+HTcqOU3TXK8F6No3/lRQ3yPm7nNxdHwJs9Vd2/o3dO2xrY=FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCYDaI9rGXw3zDNsb2MDiK0ujtUZnsF4lnU2V0s3ansOEWWeB0K0wF30OHzIYwQ2J9SEoRO4s1caOgNRGVRXXiWyUNDYB4nTIhZFtqMHzTdTY=FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.STTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m67$000000" code="stt_rec" order="ngay_ct, so_ct" id="DX2" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu giao hàng" e="Delivery Note"></title>
  <partition table="c67$000000" prime="m67$" inquiry="i67$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="kh_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" filterSource="Vacant">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày lập" e="Invoice Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4oJ5MeNIv/M6i+U5H+GQDQB783EBOWy3+yP/IGg9oXcw==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Giao hàng" e="1. Deliver"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d67" external="true" clientDefault="0" defaultValue="0" rows="242" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="STDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" disabled="true" categoryIndex="-1">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="302" anchor="5" split="6">
      <item value="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="11100-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11----1001-1: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct],[ngay_ct]"/>
      <item value="1110001100--: [ma_gd].Label, [ma_gd], [ten_gd%l], [status].Label, [status]"/>
      <item value="110000000000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d67]"/>

      &ListView;
      &PostView;

      <item value="------101011: [t_so_luong].Label, [t_so_luong], [ma_dvcs], [cookie]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0" anchor="5">
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
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
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

    &XMLWhenInitExternalVoucherNumber;

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxtLnwZV2ymLpU8MnCp5mRyex2EGu5ZxNRnBpijR3cRAifWYdc6a0BIFXo38wNLn3V0+TruleQY++MD0L86CZe0SWLKWhVtlaxTk+xP0JV2RTmZxV18WoQK6LCxpegehhDaquZdL6fgDwlz3T7J4X/6yBFnJcaRU16+Hrp1NjezHk=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBnn9/d87mFLm02qq/dg+W8IzcZ9WN5twoIJT3jZWbbT/oPxV9/JXekiKoTvM5SR9VP7Ups1LbEY039iXLB8Ceg=</Encrypted>]]>
        &AfterUpdate;
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
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8ekux5PaoAtzG4NlAfYZ9r4KuuJVmgc/K2Wy09yskFe2RwVaS+09IQK3rBrmx5eStJogagLqeV89/zMnuCJpc8gI4N80Th0ZJ6Zqz2iT17XUDc2jprqQzMYtFbYcpsdoy0i9i00phIf+uIZ13y6KeV55yjtVLoOrIbFQjm5AntG5FY4wYf0EfzJ/+Bqrd6Y5uYqm3J2Ft9X1hL8lCbD7NjlqbU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22adMpRsK8sKcPBVkagtne8KXkcDL+Ggk43HWbPcXEYZ3bpKlGWaZMr2UP0yR7JQswGcAPLIdTWrAsK782cyOKmkceiMBOe28YY9O+thenTjtxpE2i9fcBUbdiVha1/p6DfRJ8zicBrVTQ68i+xhOdL1YKL+MSMi9QDRBginkpFnwnO5U1ohDyqcX77FEuSUCS24q5jqTmieftU9mB2vWVc9x4Castqldnih1quu+fowYP4jEtZQbKKeB6mG1J+9A9bxaSAw3Y4cl0S60hufQKf8=</Encrypted>]]>
        &AfterUpdate;
        &AfterVoucherUpdate;
        &EndUpdatedVoucherNumber;
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8qc5qxK+6sUy+UmoQ+HxaeYVvUnAU27K6D6j/+guEfCy5d1ZUJRyPZJF1rgP43OpLE1PVsHDOrRt6Ct5Gyul7c=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4SBjE3mUP4Y3UQ1s4+xGqreWX1x1q8bXj8VVrmQ/BtG5V7WaCyCC6c1KbG/dZMokUL3CjVLcQkKnqpT86seZ+QFU8EJwMwS4qHgVqkHuC/vqEJokvbFQTXGSg5LuO90O7wOioa/GH3FCnJAdvwEHgc+ECvo+FHXvWJ28IAz5q0+I9PSQQ/jsR0qTKTmcMC1IGt2+dSoWYGcKKPvbvhJUEg4W5jhNdN4LMsKG8whNSetMqUJSL7T710YoYLzoxEpjJmmmHdkhksdO87z9pWOp5DPMgdITMBB2AQK6yCN6B1a0KNZ1YrPe8FVlwwzOVzQVRI0xJn3vWUssXEMaS6qxyba9CxbvbCPEc9jDeKYk/xpxtCA83wM1FHqEFvSVVZrYpRS+6p9P7HKNvLXbd0ONE1dSl4LAPwJ009Hov72sMiTAJ5z0vXYIpTuvBZjLdSypMh4G6DH9UxwGjwcO8gorii2bImDgrnMftjDkF6bdNI0nbTEwyxCGbZ2c+vMCCT/AOhz7VPPuat3teFZ/YrTOVFFbNzP7irZ6rhSoafhwTRDyHoI4kfy5XYWhvWo5Tg8cFSDKlhVqPxHvmthmDb1J+PXL4gq8kIW7rrpW69+mv0cuuVygVAdLWqPMduZUYxhEhZMStgABcaPCK092NcEalSif+0Wej0XNpsvl1EvnYmyCIwDLcZs0s4U+ZVw9Wq9pA9Kcix3ts9ojidqMygLSUzJaFw7PqzPwD+Q1L7ak72RvgnJcz64Ld58wPifbL+SCX67Id9j9kjDL9Pwpqitl+n8ipuDSZHeIsLGEm8vZRUj+0JZPbVGYxVn1ZvjYP7BkU7JpJCgoGjgLWhCHOwu71qQ=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9vcTcpv78KaEISuDP/HMMEGQr/qASNh2zP5HLYnb+2uGciSz6UuRn4CcCasl4uSqfh+bLXKqajN7SeyrRbQfcQpwpmUx1jT8SZsULKgI13xRkdMhE131Z5jZEN7d74A2mN54i3zZpqMP3HP4v3AMZQKVYgznazYAzm/wLyFo/7TTM1nHz1mP7uxACxuVurXsV5BXeBofjm6quJtQoczMRPP0zn19M1966ct/HvZLOfQODaDMGa8dhaIF44lbgiea95D5UlJfUsOAeYRMmSGyTq7AlqdvR++vR8KbqwqV5ejg=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cOdkJIIx3pPw1L3r3RKmURR8m5+PU/iMzQkaFFOc8+6tVTWhKp1ISJtkuDdZb9ed9KB+n+d0HD1vy1Y5jdgYI9XMYD6iynu2Ki4WhoxiWsVsdSdx/cC0GWhuOEh6RxIl11Kv0ENgbaLpzpmB0gTDHcbqHWuASkXjIg6wcr5/gvVt2tvVG/QZGTJA8h4AAr+5NYMaICdxKdq2BE6FFFj/d++PVgLiQEV26ESGVmlQ5gNc=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezaY2APtoExCVZAM0fhYqKo8VTxs7usm2o+mjxPxUi5PoXSWcS9KRH7YEZltXvvLkiSrTno/+hCLYxZgxUaNd79/oraInuHCTZQPtKxCPa/LS4AwFFA7VTiEjLCqIj8n/0CyMwfhlKNbmYjPWk+rtOKrn8U83i4BiOMomabBrrjs/Pd3WRgMzXZUrb8rR9rDB/</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+45d73hsHaY0UF8NnB2EOmYFExZTdR+X/cVMhU1MQNFSJAJIAYHRdIrrKQmhix2GIfA0m43yc2g/yo46k/4UOg7s=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhTQRt3Dw11wMyMm7+4Xzc4kAJU5E9jn4zG7d/pHJ9sCPfY6uXTAu6cZ2FoJEGu6walDJRoI7siYt1TVJXszQqYGPhgVLFsM2ZsrtE4krh2KvvusLIbNMKXH4zznsLZXA4gLaEBKK5Z/6Y9icEuADZbOmg02QRKdTAw+Hs7fmaEaPA/atVPcQ8Z+70eFuBMSY2KvF5gjzQhjgOYc/4RsTYsbSi0Kv65s/0JuXHQCD5jly81LzlInjDXwOimElJmfPsE=</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUE93vhS7Z6O1d7/MpPvjq/hVNGt6K6XJyxOxMfmrgyJyB4hgbetDfW+Ho4y+GkP3DT0NuJm4q9u/QsPpqrUstVpUTxmqo1Dv6P3/SK21NSZGxrM4AjRTgPNU4+Ha9MNo4qocQuIalU/rZiy7U+zWJVgv8KJFlQGyTsPzRYbVyD+Q=</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzgPI6G//d3xSgrfyqkXgpMAUI94BfGWqMAzATWVXhCogNkhKm5YUclZXkCxBN4r7DL7tcpPxvjrwylaorV2I0kPqggDKSZOe8+8PcCe2X9nwcy8nZqrt3/KQWBvBjCqh1xaP3jTWLrKm+ARBak35OqXQCjpu6dZZja3voMKww7zabBfxJheouoP+63ms5+mUerFReAVAt2nbAuosJpF1jQu</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    &XMLGetContactInfo;

    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgO8zDuOl9gN3a3c1nV9VJOFUZlpI995tC2X0AMNAfZAwm95/it8aIc/ekqABPI1k/zAilFzGxPFvP4nFRNaMRyQ==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &ListTicket;
  </response>
</dir>