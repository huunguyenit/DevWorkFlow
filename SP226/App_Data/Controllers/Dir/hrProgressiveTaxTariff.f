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

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCqzMG3En9yCqqoc5OHCSnJNPN3p+IAKZBsRx6craMG4t1Sh9HkN3nFWuILZDCi5zf9RyX/Ho9KeRz6/hm6cf8HA==FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrProgressiveTaxTariff;
  %Extender.Ignore;
]>

<dir table="m06$000000" code="stt_rec" order="ngay_ct, so_ct" id="CN1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chứng từ" e="Voucher"></title>
  <partition table="c06$000000" prime="m06$" inquiry="i06$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" allowNulls="false" defaultValue="1" clientDefault="Default">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai%l" key="ma_ct = @@id and ((exists(select 1 from options where name = 't_tncn_thuc_chi' and val = '1') and loai_ct in ('1', '2', '3')) or loai_ct in ('1', '2'))" check="ma_ct = @@id and ((exists(select 1 from options where name = 't_tncn_thuc_chi' and val = '1') and loai_ct in ('1', '2', '3')) or loai_ct in ('1', '2'))" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb78NaPyJokfeIi+gS2di+rB7J0MzSqL51uoAKwjFbKLLA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tn" allowNulls="false" clientDefault="Default">
      <header v="Mã chỉ tiêu" e="Pattern Code"></header>
      <items style="AutoComplete" controller="Pattern" reference="ten_tn%l" key="kieu_thue = '1' and ('{$%c[loai_ct]}' &lt;&gt; '3' or loai = '1') and status = '1'" check="kieu_thue = '1' and ('{$%c[loai_ct]}' &lt;&gt; '3' or loai = '1')" information="ma_tn$vtdmtn.ten_tn%l"/>
    </field>
    <field name="ten_tn%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
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

    <field name="d06" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="265" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrProgressiveTaxTariffDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_tn_ct_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tn_ct" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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
    <view id="Dir" height="326" anchor="9" split="10">
      <item value="100, 70, 30, 21, 100, 8, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1101000000-100111: [loai_ct].Label, [loai_ct], [ten_loai%l], [so_ct].Label, [so_ct], [ma_nk], [stt_rec]"/>
      <item value="1101000001-100111: [ma_tn].Label, [ma_tn], [ten_tn%l], [ma_dvcs], [ngay_lct].Label, [ngay_lct], [ngay_ct], [cookie]"/>
      <item value="1100000000-110101: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia], [status]"/>

      <item value="1: [d06]"/>

      &ListView;
      &PostView;

      <item value="----------1-10-1: [t_tn_ct_nt].Label, [t_tn_ct_nt], [t_tn_ct]"/>

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

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5GQ3ujB+G6PxUXu8157QrM80oDxL7nZWZ0KcNjPaGZd8t27x9Y2mLmnui7AH1AcP+yFfPP7SYl/3SJ7ZjsfEiIY=</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AslB4FmLPRM6e8pI+ijuN8WslRY/yBkqAcMOo61cx9BYESFAykZY+37RhJLbbYVIOoIOyRz7M9bx4F7KJPqw5wjH</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEz+QJtBR37bXqXwgZOunbzsmYxcrrRHd4wusoDFPB8fwhtlh+RfS7wJQq/M/NX3SseRUEyPYMK6ddcb8OKl9ys=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8ekuyvA5xtnVz6gUpWqGao+2kplOJvqx0SVml8/SDNOe2lF3WAh72wGp0vJTxt+LXEBSYesEdAnfclqJG8c/vHdnpUkW0KpSMq4lfXPu9GksWWhXhOok6UKXJdVHRwxHZ30/fBFXhRc22pOvEuCZzHaGxAtIp1Wwvlc4MPS7SwKhIna6kuDzP5wa/gVkkStNBG/6OcnvG+xwQCs+ytqjm2wKA4=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dyu53a4n2EyscedLk9YfCwEpwdRK0N81yHcDH/ileUlx2jlEfSgiRTHdQY24GAef2a5mJknUQqlyEXUWGjngrFBXBirDEKgKz4AExQAzfu5QjIsmXBIJXbUHV2vDziF/Wxyhk0wHD/B5MSoI3juKEGbCj+8iQRf1ktUGAKWt1kQDiwSkuDaWYXocFzaqQ7dAYFbfII1d0vkGRyALR36jSwLvN94jRPMS8wwI7ivAooyGrnFY5MFr+32K271ECEFFg==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0CKTkhGKDtbbZ5KZaxFqe1s/jK+7DhyIKMwQycOtXabaFViii6/u5WhuBLMIMZp/PQ==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBVTepPq/RK0ZHcGx3vzmWllaktrR3ayTGRTqYfyAsr3yG8rCrJUSZ9HQsEeOusLKYkxNnFzy7VssLxZehKFu1xA==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cFrDGACHYgJlTs+aCgSnkeh1yvT20Imdg49NXRiMFjNahbqcR7dz1K1N6PWpYKsSHIxYKh1rexIffha+yhwmOIunJokuCaqDSWA9lyIffdKy0yqqJeDh6RZ+JcmO4gm3YAtlP2oLNF5ton1/1kZFSo=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+MYv8XGG4TVYOq1SdOrDIew==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cFrDGACHYgJlTs+aCgSnkcJaSn03htyRk3N8+oBhfqcbVjswrCWUA+VkDQNcy97p9kcQJMFMdipmCXoqRot1YL+hrF5vHOqu+mhJOnjXhzT</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezJyWluZoBKCmBEOtVtDR7WfzQrLUVyY3CuGf2Vev43Ml1u7Uq3H2WrGe/NOfAYBTlYg8o8DrpdtK2VkCtx20n4fJ5dDCRL8mp8v4SqxJtm4RHnaYW2JATVsZ/RAqj0MOFzcGiCrtH/Jx73bsOlOJIbTpliszq1TloR5vwXx/O+zAs4lM4fAw89/YTHliEH+bp</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5lrpmCxCwLA38oWHO/h7SxX9YXYOy0LsdCR0M6b8i9LVYM/mmUw8SaH+t0tUtmZCzezJ8cWjzywEGxgnXIXsyzMIMZXqHy7kvHjYXGVhifp8OsuH6vtER6EjTcjFf4za6+fDK02Xv+yRLxZwXbXgvKxuWF8BJ9nDbP/5pY034xJFw/MWI9kJ8P8WkaCVBvj3O42r7kDRQPvqQcDC+/92YBqXFwMcy213TVsB29Jevw+n32nbGTaMKreReBAijxKpuU3OGwG/OO+NzfaoYWf6x5B+yYnLAMrQfAWxlPzj6EhM/ek/JMSKfpcZWxoaqRQnRX3fRZp33WHJ1TAYEFy5IrLBHxUhS8iE76kjbeXzSBRGDiysfg9WeCpDQYyZpFEGjT</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSuCmNFzkCph3T+0tBGshpfyFBmJlRhXUrAmAzxHAKOh7</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD60AXPp7I9fFGdGn2dfKaXPGI3PMAoBBflROuEDJwFYSTyRcfoCogRI+IH2Tr3K5Edi+jh8+mO7gcqrpZFNJfoACQt/LHlAZgrwmX8ha31PdV+UEvWWhz940epL2IXanPXbxn+MuEeuUWQz9qWvo0jFUHYakJ6Q/FGGNW3X9VgPckXyXvSouqN+bRFQ0xLQ55Cflu+GdxOWSVUX0aE0bZtwyE9U32mv23gA0yfTlVtcdQ==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XS4iSUPYuIm69s/n6XE2arqdZ/6mABh4MDwJnInqFaBwh687xm9zRrpM2sxUZDtUYbTpnzvnVi7qF+tiVpWAYCPoy5LFoHN/Urtwi5X6ZlOBCvt+qHenopbxoAaPWeUH5T4xXpm2CjY+Z2LUCwYcvU=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGMHKUwfmsqGHhcd2vEedRMMh3qdbE5L28dTBMQzLZ6l/8xy10jXgrsq1chmk1aqgYc8g/o0L/fY+TNNQ00N4UJtWk1fvKZ8oV1IGsPn9t2I106RFuiSBfiKqV7aYgStwsJQL3z92QmQp/8ujrVAEkZnmH6M6/0SyIooFeW6h0kt5unPTMQ/J2OUxrcZpkGZ0p/jW/NPewg2Y8+++wvSsk7XQkXVpKHda8HHSbwPMdrJVb7PQPQYxpbwOHBu7PJhOoxN6mH+qJdbQWv+OHA16LtyITX/apZI46KIDcfe/JOe0fEJjSiUvcHRbjEYeWl5ijwJ6o3FPl/9WtQiVsGP1yIFGlvyeHawBLUGeXDFwI0Lfw==</Encrypted>]]>
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
    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>