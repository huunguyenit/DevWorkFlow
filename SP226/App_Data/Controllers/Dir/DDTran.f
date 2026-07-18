<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
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
  <!ENTITY ScriptExchangeRate SYSTEM "..\Include\Javascript\ExchangeRate.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucher.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcEuiiRqbHe3Pt1lLhOPPPMdo0TMsIjhPgz38hCJILvgc3xmXVdVsRthxKUVFQ6m6s/2L1UG+JhqSIoLDL8rdUoJIN9rcy5T0weA6nlZy6wVNkkr2/1qndDmllpFFRIc0Ing5csUNZUevRBtWQY17hXM1lMFP8n3fVr/OsYyKHK6OWMWDjo38iaMKO5tE7sClOdMLE+JC5zJHu1KwmUOUQMcHUEGl5BEe7mbLCT/J2L12NIaBs8HvC0lvldohuHVTu3JxCzlUvkJinCdU09oZ8jCzZtpX+qbDLUhk9rsbJyohRTs0ATdC0HGQiPUeOucgIg==FastBusiness.Encryption.End">

  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcJ602xaGs0y8iDHx2mSdsuMZdQ6DCUTpksJa1zz8b2jVVFYSlw0vpbS1CvPfU4gMYQIP5636uzivOybH90NjW40n30gUTwy83uogcQgaBpG2TC9vVlkOmYYE5JNPCqGVuWLUFOg5RTb+8aKWrN4yXvaJoKCTaDWcjWkwDlr2C3g1z9NwZgRiBYFs1YKRYuu8wIwS8oO9AQ+vUtGyyWqXbNVyBw/yeIgWy8S08FUkxwvVPN1Se8/yvfkr/dNH7RE7Wn9ysI0XggcfyQbXLI4iSwj+AL9nZ874n8qADMMK9UclXDGT+kxCHMj8u/K+Txgl2Jq2NKubomW12+sciBWJ7lFGnffasPJQvmMsF5chc3C8FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpC3habzK8GcqUCINPS/FMorysWCIf7xHjlhtcIjlGhK/1Dsgy7WHhrgrRfe7WonGvAZB6XiCVZi//Wt37eenYCFw==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$H6MZbTfLMB15uI4x+okVTHW7jepAiPT7NARF/hBgODDbmoRUs/tis+i7C5GgCe4MrEbG+kKULo3jg9/kXYI18ztWLDrRo1GwTiiiykROY2aoJHX/Bif0b3lOxnrd7J0mFastBusiness.Encryption.End">
  <!ENTITY Delete "FastBusiness.Encryption.Begin$7vCFVZDwgri3tr3anPQUZlXb135PN3m73TRqZl2VkdkKqgJwGvvbWrhHKF35XVKZnQG7IUvHXfA6pKubWAt2hg==FastBusiness.Encryption.End">
  <!ENTITY CheckOverflow "FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22Y+IY7D9q4hyw4CsBsBp4sInl18s5Ing7rt6QYJOkR1AFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$T5EkQBpcXNCTKupcY0FFkY7JzlcYUYo9SqLCTleI4QgECWIjk8LTWlNXiMbHNmJIalMy87LEAm8Nnd3NofpwkQSvtikaa0DR0MC720mCYsPDa3NtExrGMwZDtBBJ3VuWgrRiD/arLN9xbqaaipPLaHXKgaddIONbJdjfTAES8vHJjZf4QLUSuqieISe2tk0zNnyeNJXmmmfqPCnEWLJv74+e+CxAMnj6ollDCCInRQCfu2SMBtcSzJx6tjdVLf3eeeBUeDX8ManS4+OelveG4w==FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$x54+tLgWl4lrpY80Qb5NhO09Xp207a2+B0ayP2BpS9dvAZeGEjiAxaZ+PlAAHI8LFastBusiness.Encryption.End&quot;FastBusiness.Encryption.Begin$mMQcSKIn86tOHzSeTQiK0d8MleXjUSAnM1K8hV6vwZg=FastBusiness.Encryption.End&quot;&gt;FastBusiness.Encryption.Begin$wYdW/Trq/wlef83uPGpQ6Xw65XCkd8WaqfkzGb9XSIY=FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$L/pw6lFTyul8Pp8lAslqPL9fPjFWeLP/fszod/qQ8Sc=FastBusiness.Encryption.End&gt;FastBusiness.Encryption.Begin$2pcLHIFTO5GJvWdoB2BSXwwhbUTpC+20bLSR3J5FecO4PXjp62tQBguA9D/InlUupEmCTTeoZUdCwS25E87Oo7LLlXa6cc9cZrx0bDRuAe05o5nIze9ltHpCECTKT2ndr1XVjm058zhZZpwSTmGfLQnH6qMHMzIaPWoc1i2+jos=FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$x54+tLgWl4lrpY80Qb5NhO09Xp207a2+B0ayP2BpS9dvAZeGEjiAxaZ+PlAAHI8LFastBusiness.Encryption.End&quot;FastBusiness.Encryption.Begin$mMQcSKIn86tOHzSeTQiK0d8MleXjUSAnM1K8hV6vwZg=FastBusiness.Encryption.End&quot;&gt;FastBusiness.Encryption.Begin$wYdW/Trq/wlef83uPGpQ6Xw65XCkd8WaqfkzGb9XSIY=FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$L/pw6lFTyul8Pp8lAslqPL9fPjFWeLP/fszod/qQ8Sc=FastBusiness.Encryption.End&gt;FastBusiness.Encryption.Begin$ikUPZWYFTC3+HH6DAZXlD7EaMTCkohrJMogCwTN5hAOczHxZNycdSAuCmQSmbESwR6IrlKu/7Ao5mZe8ae4UO3LQUWBWWmRxqM1qqlD+/vR/5W4vJzGO6zxqS292iImzwW45AfuoOHbSi//S/Qo5SikXUEvZPRgTDZrnPDT0gzYvs0VueeWy2ZrE77Y5v+GCUR5eMdsANrMiQNxVjMVreomxO4FnmuzWwfPMktsAXyjO9wb8kkEfji58mK87iUTQQ+socNMbolmyPphPlAbeIfLk3C0vzR1MR9w+cZdK/YJv4m8+VcOW2l4S4YUXfq60Rg1UDe9xtGI6S8PtZVEUwp10QcaKwIlrviMhErhWG5iSfD6/QBWfLSPiArraBh0EYkdScd1RXoEZ6sV+RUWyq1/ieHBO9tmOQnLOc6oAjdVN56/UXP4lQQ2XALOpBf5iNDftXMgNtik/U7OINXCliK7cKdwSoFiBWKzvIkeJ9GsEabD09J1sFspZ+J+CaE4A+/PWbjEelw5R8E0I4oin+Q==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8lCaiqKRBD5C3p+h65lvYj9A97w7P/kuFGMslKTIjgxZvkkgajor0NGWhT8atDuUU2GkcRH7nFW5npRxtvZN9LoVJf1/pib3vCaJ2+Mzqn7jNV10iRlW1Oy0ufpEbgmkr0FpqbiNaAZ5wpz/5u4T8vqZ7qvIIg1rowFQPaKstNy2qhWD7aXNdqriu/lkS0ZVevQ3hU3JZRl7PYGztgZt5yc=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8vcP1fEwnIsghBJP+DeoIvhcQMi2N8Qnprdl2GqQ9KBG9Sux59Gm5zV6F11cuZ9Nej6xKQ8LR3cToXzKkfy8YOQSm0PUk2OCmYNO6kAc5sFFcr3b3HNANRrhDvcDE3BdMg==FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.DDTran;
  %Extender.Ignore;
]>

<dir table="m53$000000" code="stt_rec" order="ngay_ct, so_ct" id="PC0" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phân bổ" e="Allocation"></title>
  <partition table="c53$000000" prime="m53$" inquiry="i53$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" defaultValue="''" disabled="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Create Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5BYwfrIxe7sbc0hyR4eVljmUTDHmx22aCjIAbE49BcDg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="d53" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="297" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="DDDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="status" hidden="true" defaultValue="1" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="357" anchor="3" split="4">
      <item value="100, 100, 345, 8, 100, 100, 0"/>
      <item value="111-111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110-111: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="110: [dien_giai].Label, [dien_giai]"/>
      <item value="----11: [ngay_ct].Label, [ngay_ct]"/>

      <item value="1: [d53]" />

      &ListView;
      &PostView;

      <item value="--111: [cookie], [ma_dvcs], [status]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        &ListCategory;
        &PostCategory;
        <category index="-1" columns="445, 8, 100, 100, 100" anchor="3">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNJkeiPDWpL08+ws68t8jq4j5m/tiYeG1b69utAr8TD2lncvAcXwp5+4b6+9RMFaAK8HjkiQtQzvUvVWDe1F+3s=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmI5h5y8/E50cIImhg81d89CCbMMAR3IWMw/im/SAa4Pcw3ycXR6FwOeUucxJvcyFXpfEOapoGHwd/gewuP72JZ2v4Bn4YZZHkblSfweyuq3KkLX6f4+p5Firr8F4Yx08s=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGaffJM9cSkJ96zg9suarQKjR/YF/DBpKASPKRU0MGROeQC3e9oO55KA3evq0DIorKsD5yR2rXGiBcV3LjBhzwElBrqSov/CZWs2B1noac+3Lbb</Encrypted>]]>
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
        <![CDATA[<Encrypted>&fX4o0nK+AW8MIUygIYpQ79kiLkPS4vffV1QGeJ+bGkvp+UkK3M7IPlL2V79VZ/b2XLQQrLvKV5roHRn6PXu9cTaXeOPqfPdEhVqFn9fl5CcAMlXT6MyT2YJEt0bxJ4RqTDGKrxdKQ0JicUksaHwGudYV3jIU/DzCgJ10Yf1l1PVWC5aZRmpCadoL0wVDK6HH</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CheckOverflow;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPInBVr/p5S5iGbyCRl5gWbODqccshl/CjoJ226uOxZjGYwzxyLz2pVqu72jOO95ysWwGnKKoUgzKoY8svE4kHl3TKT+PkMNPIu4klNalBjdeTIWsOMuJf19azd4BUPnpRT3LlU6jO2xR5TdJzIBrnPm8kJPB8UlaY1SHpuR+dqxV9Bp0VcDSfvhDPKhhi0MTw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEOZYDUufwYhl19Wi+7Tw+kW/0QrgwCGXI1+Pk6rcd8jnL4qYmu/m4oEfYcRLVDCZWVltuqCCdNa1wFwXqo2SMjV6u4rEPQNWO04KlISTkW2QpBjKVp+aBANH8PosWWDFd3AbP518/Jl1zjLXYZgnJ1RB6vwPGfKHLHcpAHPlgZj</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34IHlwt24I/MArn2WpObnAPd9LPwnQpbpIQWpziQ+9oUQtj1MORIhdXX3ASpETxt0v1RqxxGjJky0taoQlgYJThXYoAMwEJaQBsQgx2ct3GhdA==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckOverflow;
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        &Delete;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5UwZZ27/oNkzgol/1LyRlLrMJpCwuR78YYv0740+DgrA4Z9HJAoz/ln/2hzZC/zc2T90faw4iBgeLlK/vQAHc0V67aJJ7aMBNzo795rA+rsvOOxNLpKzIeizW2ZqKgLYP0eobA1VnV3rsXYvC2GyVWV9b5T+ozWg3mPDtbsZNcP0GBUm+KZTjgoHZhRByN2jttr2NRV4YxBdPvOlmeJDsE=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Y+IY7D9q4hyw4CsBsBp4sIeTMtzqFWco7h+kla0QTfYKMgN8AfvViOsWF5w73dNAMUeEdpnP/XJN1SHHZ+zFxL9oLgrvPw+FLuaj2QwOyZ9T9ZF6pg6l3uX7koFFLc8W/vkiJhRikoWnp7B5r3PRWdLRWD1j/ddQxuK6jQlY0WyZe+EQHv/fSHt6JqUihJqvcQbAyoz7jRi66FKFauCg0TWHPRZG//2lUvAkGvadG9By5myxiDA85nHLhoSbJQzkZH4NKCtIukvWew28m1pPVfLCLABWHkz4QNu779vBXlV</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &AfterVoucherUpdate;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNhZJeqlGKX7sMOUOCtgThMW9La5LeEoZ/dpNGPeDCfYvtGmVbi+4belQqkRmHrhA==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        &Delete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4PsDEEp7hi5xYyXy2UrWtS26h9e2itNK6gevu0pvI6fnpCGJiic/dGSbJ2t0L8p0jc+H/VsCi/qP694BcZKOV/vIam2yaymq9MF4j8vCViNHhuHJ442natyCHcGXO9h8R8YaGrN8/p8UijGbLdKZtc=</Encrypted>]]>

      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4ZHGyS+IwQLW3KnVKGthe7ama7oTtjGGdpD2AR5sE316ghcyqeneBe+g/SM+Ud3K121pqDQSr+oDzAdEtdkPaNgW6fDaatPKrqg5JqW6QWLYcnpnsLURuvTW+5rGepj9Jdl7IwVW9VOcQbAA1gycuMj7n3eGoy+R0TVndd9aSruGbIuZo8chJANtv3oaig+gLZJmrtGjqlVwPQC5YE5e1DIegCcIau9LEmBPknY2jOlUbilWuju9iIjyTA1CmnMaxJ+k7PdgnFH7vSOq7x4jL3f3E5dnprGdTbixrd7HRtotCuOAloZEuJEHIAYefDKmUGJi0sVwlbdspsglFi/nfgv/r4i4HMR2wsD7SpuGBaZKsCGVA9wQ1/Y7lVsxjEED5/JwuSdvWceautTSySaP27E0tkx4UVlb9HOcxsgsiLQMV78vM4OSOw9HfFbi0vbEz2Mf54JvKgF8B+urGEIeC1yvZ3g2BhQrFYYIcrb6cmIbAHP6KSuEJXJn1LK9EKFKMIdTjcxVj9JFdOtTAAu0Zv2ghtHl0Ei4PZaY0BwhTyH8xPqFnsuZLSL5slSQyD8+23o9YxWzZo9c3DTf9+po54EYJJt08hF1rsWW9/zSf9hqpi8t4KYsSe5i/emnnAqACnY34TgLSiiUi2riVatlbtGS5KNzsMcn9cV6sVgIgz2Z9Vdj8bh1Z2CVmYm3qqBBGiX+D4Aulxgu1aNV+yDeusc4UWZCrDhAdbErCruZAFYmwLhszIXGeNZEP7g4scB/t7FNIthFHk7PGKEVG0suRtg4d1uYktXiCduPhh8QvOKF9uQ4hGXgTMt7dwGg5IibTkZE69qiagMq2JwTZHd1UJSf+nv/3kbMCFN/FBn6whZGEHHsO52HsPFuuybmuUxgXgckX21QYd0M4DvmjCOPzemctnibm2tU743IqHOHJkTHZk74mJDWQQJlyuTMoc5aIAnzV+wpsrJvsA63vIvPTs1zc2m/2P/cT9vQPs+pVZc5NwmX2B3F5K1tnakzDtwar/iPoucL9cg4Yu6x8fRMKU5e91eO75tiiYz0D8Sp5xAqrv6WW6nH6U7aMEst2TueQ3xOJT1S3brbA0XHEjy6zMI=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwZ/dpU+llJa/W+LMyYDVYlBvBroHTRZduHSFsrI7bRG3TUZ+rXGn5Xxc5wCq9ylJt1RBeRIRYVKANt2e2RRAYnCo7d278lcdxJZOmWGmGleBpYQtHthnB7bweB+tJsJPRrApHp/7ctFZNlFDvDDDGiT6Yt20E26zwjGtImKjw0xeLERwW0DUvwLlHlZbYoAMxDh4AjGNr4LPAOnH5YhKQ49I0crjR+vKsF/ZEEaGJyATn5jE8OCJDzOG0/vkHXaZzfslodQytNCl/Xqnra/iOoYRzdk6Jk//r7PuGxolJpfS8AAClZisdRAbrx9mQan4Bn9bXGVLk+t7QjH2ALVwOOJ+HFL1aq3lZbxysyNAEA1ogWG6b5aH/wVgAmXThZlpbuLSEZ3THTGU486yD84c6R+V3HwVI+/+wxT2HI/C81YQ==</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJeGKFHibjCh1KrlPY4oM2KVnaSl0jHm6/howzQrqjHgo+nPmRUBh2zWSrzUoZy/HD+gg6m09Z5U5dPfuLqipVLXN+GRW1Xo+NOD+bWPJLasOaiyuXxmPPrnY4CK01P1ekcpxEHMoiyytN6FYuSGhtwSFGS0zOFpTBpMKuAEf4T2BCJP60TDDpLl+Ke8rhEkgAGMkRcPkORNbHQO0U1mbjdaL06sbY96ZtSeGZUG5A7Hw=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezEIdrVnU3oVYc6QYv+DebBJ0hyQCFJLeD+6HelKDBoSJP5gRXi/6vBwfPhx1go5nkjUnrZASwRxrv9Vi9glSyBhv8L5X0F70ra2sZizq4VTQ=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RUSvFgS+eLk9naQvI5EkB2W2luYghHYJWmH1e5AMY1TESMN8sMzATKbZjrk8dGpF+hL3oBu2eAs9IJzQurwsv2mAQCuthg/fCnyhSAf+OBdl+7YOjysquWhop5x9q7gC27irNnKVZKBOFx2UEU+KCsz9Ef1nOLX56STanmES/8IumgtevytFYitPnUDuVrwCfObm9W3UPLXi5lhFDSLY9VRERARJTvKfpg8n/+jQSUkjyHHbQI1stXr4/KAlvD+57Nw1PSWq34JDpezojqYl0niPei1ii7rBBw7XIFrQHYB6w==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUGZBj3XcOzatM5XGYYefE7p8mZFVF1aD3BUmrhNCLeLPhTZrtfI1k7aBX3YF107gmLrNTq9VAy5ruBxoBuzAXyIoZGzWz5yMH5Nrb0T/u09t3wqFit+QkoeWxNfjxA1rAKggUrLf4UxDMBKesucnx+ZIZQv+3IIEUmJoFolUbtFvvd5dGPUtPYh+3EhH9neAswddEOj5C6A5P/Kie2GFOuw==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqsRfkgz22MclWUfLV2V8ct63xXygjA42DUmPoOxNTD4MJrCEvohECFsjaPtVaD2VK2PFpsUZ6VRhJtPPuwVYNxVR9AdDJkE9CFiuGG44gPEHBSSC2C5mNsRgilsQ7Yq0Ze7k6LTd+AgpbpbCGD62rNfrxyHsctXkaubheZAP2zUq3498F+xhz9qwsLZy5Z75F1r/HnLKXXyJNOBOj6Fo7ywMDRZuuXRiGcldOC9wam2mv+7SSBHy088y9q6WakScjmXi7eCdNVuDyxpSTVeJiW4psbnbk4eIL+WwtNl3RmCTSL3nWlIyzcEkk8UWO+Ku6yWDAfRyYaUn2h9e5VKIeUohtOh6HsJX4Sn37bKy6QCESjo1YBv7dcWZEwTdTQriPZpegPewYKVTzoprpoZu47/xFaRH0klPou+lm3x3Je0JYFKLQM3ZEycYPnMgwZLX1KEknCwRYtljIyjjz0rOQmkvGfLozzvU2pOSF5ijD50AgJrx7D9Sg1tHpdXDkc0Fo1xtB9zv3Zw3yCBfD+ZYWohurNE37gYxxv95DfruvBJBHMnkHMfDcDVHsAtsoMPFqc8V9wmBbtCJagsoE3yMJ9Tn3PTScteksw0TB4AN0TB+7+P1d2hXdvtpxjUc5h1fRkqCMB0ferTGKLMaMIu/NmpQVlKL/M8BJuD1j3+6Hv1jCRbupcpAwOPAb+5m9ErS9QR587XJoYm1l9TiuwLTfNTW6ZFn3gplFP0ITm/KDXni</Encrypted>]]>
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

    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwdSRYWRj/XH/UM8voPwGljQ04mkzWew1IsfPZUZcI23/98dO/dTxkjKD/oT3p8bOm7A==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &ListTicket;
  </response>
</dir>