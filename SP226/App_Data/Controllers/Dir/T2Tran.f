<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
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
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherReference.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCtjATEn+VWawZe5dhDOD0tPrTctUcFrDqgVJJ7r9DNsabczW366qJbwbZxdLutryVobvFIKRIa8H/JS6W5IS4hA==FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.T2Tran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m02$000000" code="stt_rec" order="ngay_ct, so_ct" id="CN2" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chứng từ" e="Voucher"></title>
  <partition table="c02$000000" prime="m02$" inquiry="i02$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_tn" allowNulls="false" clientDefault="Default" row="1">
      <header v="Mã chỉ tiêu" e="Pattern Code"></header>
      <items style="AutoComplete" controller="Pattern" reference="ten_tn%l" key="loai = '1' and kieu_thue='2' and status = '1'" check="loai = '1' and kieu_thue='2'" information="ma_tn$vtdmtn.ten_tn%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7Kx71xfTD9sKF21qrjApHKdOgIXB+O+xokWqvw+FPlig==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tn%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_thue" disabled="true" clientDefault="Default">
      <header v="Mã thuế" e="Tax Code"></header>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="@exchangeRateInputFormat" readOnly="true" hidden="true" clientDefault="Default">
      <header v="Thuế suất" e="Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7QxxipynEKp/u+Cjj8pZ5Q+sqSSJZjKM6T55JVypyCZg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" inactivate="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" clientDefault="1" hidden="true" readOnly="true">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="" e=""/>
        </item>
      </items>
    </field>

    <field name="d02" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label>
      <items style="Grid" controller="T2Detail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_tn_ct_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng chịu thuế" e="Assessable Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tn_ct" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_tien_gt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng giảm trừ" e="Deduction Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_gt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_tn_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng tính thuế" e="Taxable Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tn_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="254" anchor="9" split="10">
      <item value="100, 70, 30, 21, 100, 8, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1101000000-100111: [ma_tn].Label, [ma_tn], [ten_tn%l], [so_ct].Label, [so_ct], [ma_nk], [stt_rec]"/>
      <item value="1101000001-100111: [ma_thue].Label, [ma_thue], [ten_thue%l], [thue_suat], [ngay_lct].Label, [ngay_lct], [ngay_ct], [cookie]"/>
      <item value="1100000000-110111: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia], [status], [ma_dvcs]"/>

      <item value="1: [d02]"/>
      &ListView;
      &PostView;

      <item value="----------1-10-1: [t_tn_ct_nt].Label, [t_tn_ct_nt], [t_tn_ct]"/>
      <item value="----------1-10-1: [t_tien_gt_nt].Label, [t_tien_gt_nt], [t_tien_gt]"/>
      <item value="----------1-10-1: [t_tn_tt_nt].Label, [t_tn_tt_nt], [t_tn_tt]"/>
      <item value="----------1-10-1: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        &ListCategory;
        &PostCategory;
        <category index="-1" columns="100, 30, 70, 8, 100, 8, 13, 87, 13, 8, 100, 8, 58, 42, 8, 100" anchor="9">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCWJL2eknxR2Fxs6+YTyNDgB+Pn988nAVDAi1ye+NQoisoUH/kALp53bguEbNpjtFZWiU7cQ/NdyqCUu5Whj3ikSzn2rNC9NGAe30M4sZamK395Pi2XuHKGkh7iw+PGp3h28SQ2xW5YRXmJDb3Lepm+Grx2QT0h3gaaVvV9EN+CsU6zBb1dOJrn4NrQ3qpanlwAKOaiToP+f0lGtHv42gPSVLdFAlLScPsghIj+erfT4roGMt/t6n+qCwY0i5s5KoJj7h/tfe5MkOPVZxZuiKf6Z8UhwAo7HRZF5DgsYT294vltJM2f8P6161zbMa89LF+CEapXdMERq2mvqG80iiLBZ7pID/TQThx1/BybKxPbpwCk9w+7oDMN9C4hBIVs7lfrOcTKQ/o5Gf/95qd1z/tQbvksZp63FrSZa8R4YvnX93RgWpf/i/xVbyph9b3NIpKQypVVPcp7QcCqMHt8HRm/Mibtd5rOpbZsG+fc3I/LfOZ90Bri3A3+2iFVmaj+BzYWrYqRlxyZFVNfTuc7Dn8yyMYgY2xtDCJ/x8FVqM2Zp8FWtob2/ANWA3jYrdCjp+KAMpVQZ/VfxueLP3YHvUx3HBp3KRHyJ/vrz/q8KpiHyvtBqE3haL0rqNWv6rEvlfA3DWiFX6hJKCe8MdkYnZjV5tSpKIhhMr8WaVyKcuUCRHwDkOocrDSIGTa0B1G04uKSKKo+1sIE9D+O53Ri67mey0t11i3mahZjx6yOf7oBosWUGyw00UOi/RxFeQB9ns21uC//f3zxZBkjZt3F4+tq7tugCoa1bytJ9r0vzApVVSS3B1V+NSsNqrsRkX5Wj+VAyrLKy8JexRv8wjyKMpb+iv7QtZfLg0/jpPips6MqE</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0yCcKSDYPddJNnirNMzqyG7Gs3JJN8sTX6Hxs/v17uqmTGGVYrZ9FxIhAIvFAC+cVg==</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0zrstVILLQOSvcQaTL0VL9cGb/3+UmDFsSqr32Mt35HjjXZ+M037rBfeK/0qf9fjWRa8Rm7P+b3MPAp+USDPdTHFgk/DR3Pi45yvtiDUDmI5</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ7tSsXRCMEMHKo9O5CU8OUUrqGGjpSIFAs35m7F+eDm9EbuIKF19FTN/lKbYptlFLlmWkFrI7j08Nw51bqtVKN8IhL0x4KKmSr8qIG2LvDlPcHIpKMCefppg+k4Ei4gwA==</Encrypted>]]>
        &CommandExternalFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05q2JUyX1MTcRt6vwyi15QYF3Z2in7Yi2bAUMuiKjvl8</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxR7fSldfes3t+XYqEN2OEyhuHYNjX3uaIa50ST1s3D8gWGn5g1Qet0X46g7kkQPyHZ2wAowRGItQIkCc9Cy9KnNITLMxm2XIEoTXLxB5eMaQ6OgvuIa4GdF4BQJAp+Y74PYoPeHR5AYBUq0fiw88PJg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOzHMgjhZbfRd3+t4kEeRhmBNL/FJRTYUxAtnKQMomAS3H86h3OUncVJD7WznhLJ7QfZABOje2zcflZF4vZVDPc=</Encrypted>]]>
        &AfterUpdate;
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
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku2AZnJiit3FgHf8KM5P38DJNelMyaP6v22gko4FWgNdLFk5UOGt5AVFrpDqlM7NzuMBFOOEkYiz+KlJAkpFw1M9zwJhfXOU/mVm+Fn8QfUbK3f04AM5sY4NZR1OEXqn/34kZt1uc484oP4/27XeC3CZ5rHDBcMc4HQNBNXLf+f0Y9snut78bi/p/lRa8d019eiGzr7N64SMZANKH1dkrd68=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UPZruu+9RIhevalfthCd6UpTjQgkIXeduc6iHFMneRd6m5uOQM/dOWdLCgFNzlyY+m566BBIIlKYeegVboPL6Tx3hcFPVLUqpcdmQchS8nQ0VcOsFHtBkIptj0uGEvnX6ogX4sL5C2hlCEKkKqeIU/VgFafzWANsY6Yzy2Q4L+35XiEdruB2S3z3e7iVP4FpKJBLMHhRnxzrUYZoJLTcFDnZf436lSsW2qIdR1+ujUJqQx1fkGaUbZ5Egmr9rYjLw==</Encrypted>]]>
        &AfterUpdate;
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0D0lzO7ThZDehcP5YQzl4VppoWgbbp/JMMvk/nGj7A/J</Encrypted>]]>
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
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBIuWsgBdWaeRzPUaGA6i9/GE/4kiW0ulacDvsRDfp2MmZPFgtf+PIs+ylkJulBGkJ</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WJ82mY2P3PgWXyDabIZkvrVSYwWrm14KDTktZWOSMPsJ+zCPHga39QS5LUBWmxU7Oaq/sfAYxbmgj27tggq07CRFjZq9iksxZyvVmL0u2UvKf5CFuf0SDM+6sxJd+CKZg==</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&x3aheMTZkaycDuyvo/Y1tvchb4gL90w25aUc/gK5rW8pIQiIkNRgT2Jeqs7iOvG2XcBFBaVMdFaR/t/AwJy9a67YWBVcL2Gwj/HZYampHrM=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezsOnos32iArfsIXM5oqMhQDXdPfCntil1oBOKgozu3Q94PLuFOesPY0g9qWRapPEdJhlh+o7Un026repUUKRsFtSeYNc/8DAJ80mIgsGZWxr2uBvVXJi3sbDgMyZGX1TJslNEmLBBSDRopB/N/WabpuMTs8ITS9RkPxDgVRh4R5B9ejyq7WlSeP4jp7GL83Cj</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwXUnCUx92M6SraZTlzb/zxCUrEColGaGvMm+HfY8E4QYpdBrTBHrOeU7F1z4PQS4aXQmn6qOXKDrmI3EzEVd14JJBaLQ2s2Y2PD8k5T5syLTEDKp1am6v+4SoSGtrh/G+L3TG+d3Y7GIZL62HwVIaw</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5lvSIkhWnbVpGS0SI8N7gL9KSNA6dYyyRUbDQhxmTdDUZvV5Ovs2LdS+JjhJ8/CwFCAEWmEDmC8D4KbJdX0xu6uDnFL/QRezCzasuyPtLLgS8ta+dZEpM+Y27G9y9Ut1NgpOni5Jldlk3aO5nDF82bjX3yac2vYUqoj+mtU2USgY3hCiquhDMe7y/r6/+zIVHI2urY/N6KrEvuIjOh59CqSdBSq4um0au2jGWP9lTVuD+VzGHErG0EHtaYlE+h0Bx/ytD5wcwtPHvcz981I6NIh9qzvkAA+71KodNhAOB8hOeBTztph6xVDBL3+qSRYmq+XHlN27P+7pwTuQuez/lXamhqGXA4MJgs++ha3OuhqucfTy6UqlLG5xEuJvV20LoM8lVZSRKES1CLM6BT3yEMhiUIt2sZXVczOMHSnzXoUYLK+lecgyYjxSEy5YfLaB5X41JdkSZbfp0iz5x3qMOPGWsSmHWhG8MPLIb5/PeOBieELZxRmQ6OwpKRMx5O51b0</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSoYuxS7BtHm17HHkXuOKfnq3/bMAJ9pp+Bgkh4/QNtQ9</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD60AXPp7I9fFGdGn2dfKaXPGI3PMAoBBflROuEDJwFYSTyRcfoCogRI+IH2Tr3K5Ef/DuByXM8qQ5C/jsF5LR7psD7WucaaimKt35OhFJjOi/45wmqnrXHatHx6IpL5KjmPiiriqj6hdE1bCbLC3M7mWfOYQeAeh2/KFM0ON4ldrQFoqyRs4Wnh7keYKTAGfQYBWRlCb6vWB8mKwA+pjK4+kmY+T04aeMryl+C4ZJ0IYW4C33rnlaamcJxcEu6pOAxUou8KzQMGBPzZGzLqQk9jDIHyTq8ySKayNETZM51alqEv/bLOyrszryLy6GXjjrU=</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4W7l+VJ+HIinryUDrl1048gPpXeglCQQphzxMXBuomKvKIiTZj6OFwg0L39KoInezqMVX32I8eIGW3YCQeos/clV8Mh94htP1RdIp+M4ufmwMuJJ6Vo1ySxk7tCLvUhSBJ2roraXe93m2g+az3qZeV762X1KpoFn4aseQVI7xis5I8P+i7qHq7d/m1Scq9biq9PDNIbJ+UwVcKQtFnzs9e+l+4svxfYmlbEKgFcnZu0fxvWvPQWilhKEDwyRObtY/coflaTjVcZidQ4hjBr1xFeiodknZhJxsdAz7xCbTMQd8hWulT/99CLcTQlYJZz/BYLIHa+I4OYfjK/CKyf66BkD6G68hAG9Uu/LenyJ4gxG</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bGhE1bTUrbr+M+uaMLnOI+e3p4CkjUyLc0WwdwQg4nSHMZ4UC02z3C0F+ILYJ5xF9Yxe7Cjj/zMLlybtBLVqmDJPM/9V9+Kj8XtfKKeDoBrQc/4sd5nof/mbqat1torfrcwc66UAzV4pfd1CBHxo2HYeM6iGi8kiQrRvss0sq4S24y3i85NNtOxpbnNmYRJzyW2c5inwE81WjtA0EqPJQZNKtEn+SX3xnyrySxqI9Om+5piQlQvAdGowAbsjrzWykgoKWiFymQjb44W72xzBmXEXmq/ewFH2zFrHGt4Jz0RicjOdn9SBQ2JwbckjMwvBleT7negIbXMr4ksB3EpsEifoxaj29a28bjxLEshlhVhjAyVu/XDzSwhi02C5isJ4dejzayoOh/dQ/8h2/Jm1jlNmX8L/LjGFSLMsmBTcGi5lzRSi5QNp1NAze5oaTWhdzZ3Q+z+Q0BHHPo9kdyA7Gm2r6FrzUCshvYPrr9fbiEOp5BHGBDKLxwxEIKb6QUv0Q==</Encrypted>]]>
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

    <action id="PatternCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAg/i5zjnAMsfI0o8BJqGxfJJR3gJJwKHmDgnNyMK3AzZl8AJKcae7L2vTmfx8IyhgJfkljvbcLYgsHD+JlH55t+/Q8s5pt69G0sH7B1xOSPUI4z/ogM/k+PIdgw+Ps2xsBR1lp96ILGYOL8RsTmPiz7ePtHVQvh4n0Vvhapp2SJTOFXfT+/jIs+HrGnGP9yt1rN2Vzx0B2xGZWmVTwpqAtIPRHAiozuCrDH5QNPEsTjiarjkACJbIofCOscDBoYSOj8KwKJDYjzy0iMaeaN0eOUOHLMG0MKibEHA/RluRma</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>