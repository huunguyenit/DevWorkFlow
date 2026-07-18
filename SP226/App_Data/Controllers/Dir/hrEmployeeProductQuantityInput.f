<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY XMLWhenInitExternalVoucherNumber SYSTEM "..\Include\XML\WhenInitExternalVoucherNumber.xml">
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
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY DetailVariable "@d03">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCwHrN2P22UzmjwKP2y37IagHyTvmcXrCJczLdXLE/nhGbSyirIrLHO3Ky/ItkHCgLGEa1r9vql0Ti8IN9OXzlJL8o/k/lVhSHueyXotItwn47qJoUP+UqWtQNrYe2Ox+rbdWWi92hEwV4p5Kcj26zxC+4vHYISqrg93cZZev/y41YAfbuWUWex6ioHtpL9FgX4xDO22kpgFX1c8GfHEwO+g==FastBusiness.Encryption.End">

  <!ENTITY CommandFocusWhenValid "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcMPiDOKfJX0YqWDNIaVtbdTLC5C4+VDnGKbuM9stjmDGWyWKK8ckY78MvLoCrrtgYtcl1bLfDcjb0DdwSLX/i8dzb8aaJZnLuMXAwZqymqYY69dKmcVjZE6dhq1WsYt2Yz+FLnRW2fGtehbqKuY7aAFTpJ7P0SCH/f9oPXNmr+wlN4De7fEQj8oq7TW2nJTCmVSjGeWmdWpcuX0CZsouksBpeTlYi5U2uClGey2SE1Q0K3oSiecS/PwRQbp6DkUA1ak3cH5D7WqTi6qtYXdKricTfUUm0elrbF1OPUclgOd2AYEgnSEvEWx+qAz7RO0pdQ==FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$buUp+dpqA2y+Y5vD1ekU0ukO+XzRCbtq1ozzOg9R3KgQt3wXD1aTZabGa1wlWlKrdfK2NjsjYu40Oy/VIo+Ui4YzFy1ULbWffG3EOytGzkI=FastBusiness.Encryption.End">
  <!ENTITY CommandCheckValidWhenInsert "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcGn40exY5yDKc5Vr8VcD2UINveRduHEStCaLMemDbxIobvF/lt4caOtK/2rdSiUXQjN2e3XDOVJWPLkbhUA8UNPpbkc5op8niCLWO9M7nl3ugm4smjsw/m0F+jvNPh9csw==FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$l9MWn/gPSBC1DMnBxxDWBeb439pIWxxqg0hUMavQpAzjyV8LYIyvrIEViV3OG9U6gmHDbMQruR3kQhQPca7jfyJ7LALVGg/k48eBnfTxpWb2Bl+oEGJmQFJJieUv4km/kTUP21bDj8e+RmGGRWefhQ==FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$tXP3tPqmqEs3ulRKS/wYp7D1HfKA1TlP0dVOdd0GHXKz/797jJ6kKxzugzOiZPHWFastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$+b7JlU7O9lF5y8awHRuxFjI+eMaVBPuAPA0cgfZQfHLY0j2cQD9q43w8jBQN6oOKl16Rc/e1LaobaG6l6Y1bWqZZm2ejlN0a6KQQ4vyHERlbobQSAGDGWwkOL8jQOZpcFastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$hH16ORxCncxsnBLOpmo6eeKxOTcd8G87LXZQpcdaZfVRiJSiBTfkv/uZRNnx/GUdXgWr+FSH0aKWTnUoh67JXp8Kq9Zlz/980VnqpcGWhPvU2VOJoelk4fry5n3FJxlASbul9BEdma8WOKLVrqhHxA==FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$PCWPRgUI9wjOZvBuECuS4lb3XWeriIjl8hIbWnHMkxk=FastBusiness.Encryption.End&CommandFocusWhenValid;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22fBk86UO6HfKC/Tm68cQCeDRvTKrhNL8CY0wbkScVo3OgqxaWnx9o7QK0xE3BuSzsA==FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$TQs0CDX0qovkoki0iE9tM8RRMvQj9x777n52B7W2iQZbX95FQ1Du20wgbwWXOOAxW0bXBknl3/TMKCfwmTDw2nQLV9hXLR3k8JLG/U09UaH0SQ/LrpV7MuRP2wFwANvvnIs04Q6nyGIVaqt1qtIXpQ==FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$g9eHRt2pDXV3uFXvmOAWwOFhgXnAw0FrLV2sXx9Ziv04vw+IDlnIfjZPgr51vD5tZuJRbAEs0TYW/0tx8I/R6nK204j4TmOmA11V0eJ3dv51DyrZtQfq3WXvcZfGAZBkz8Rpuwf20+93Yp6Zl6/sYPopxF9CqmKIrEcEYwwDRhE=FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$TQs0CDX0qovkoki0iE9tM8RRMvQj9x777n52B7W2iQZbX95FQ1Du20wgbwWXOOAxW0bXBknl3/TMKCfwmTDw2nQLV9hXLR3k8JLG/U09UaH0SQ/LrpV7MuRP2wFwANvvnIs04Q6nyGIVaqt1qtIXpQ==FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$g9eHRt2pDXV3uFXvmOAWwOFhgXnAw0FrLV2sXx9Ziv04vw+IDlnIfjZPgr51vD5tZuJRbAEs0TYW/0tx8I/R6j3LxpbrdluBTBtlnYd7k6ZHnWSHg1/5dGwJE7zCyHmWFastBusiness.Encryption.End&CommandFocusWhenValid;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4WtYW9IrqZqI3ju9IZVQJSk=FastBusiness.Encryption.End">

  <!ENTITY CommandCheckValidWhenUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcB3D6eRVk5DW/oESDL5bhcSuKUJ4K4h0CNN08cqiJq/gWg0D3JsBOihcLW7IgEGm2/GB+wDnLHRZsZPa5h+nnzGFTDKXx0nrh1SUD60JvYumymOBmK0xWeC4RHKqbDojD9Quu2N1QZci/SyONmzunBxyjSesSagN0sbD/svOKjXXbepXb9b1jueXKi6XYV+xSuiPGykkZsjiUkPAts6CczF+OKryCizgASNsQV1X/PE78zvpEvBOtWOtw+XuqxG0x1adt9bSnFNxmUdyapfTqmc=FastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$tXP3tPqmqEs3ulRKS/wYp7D1HfKA1TlP0dVOdd0GHXKz/797jJ6kKxzugzOiZPHWFastBusiness.Encryption.End&lt;FastBusiness.Encryption.Begin$+b7JlU7O9lF5y8awHRuxFjI+eMaVBPuAPA0cgfZQfHLY0j2cQD9q43w8jBQN6oOKl16Rc/e1LaobaG6l6Y1bWqZZm2ejlN0a6KQQ4vyHERl1h4IKm8ygfO9PtSSmiT4HdSSRsUGgYbIOa9hPT+wcHOhVeEpLRa+Tf6Kpd/gUBKljxDelhUoPEMy1GI2VrJnptXxcxbg2qPcqmdSmg3WG2fq2giAe3GpdNofUd8lrvgA=FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$PCWPRgUI9wjOZvBuECuS4lb3XWeriIjl8hIbWnHMkxk=FastBusiness.Encryption.End&CommandFocusWhenValid;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22fBk86UO6HfKC/Tm68cQCeCv9XNWguRIfVDDaQd3zLjOKE7gARrUENxnHB0Oiy4WYasWElEVIJyT7pdZMfQxtFNWKU5+DnA0pDkCxJ2T+0bdzHFESpFWgOZMEhDINfKVi3n07wsHErnW0eV0z9KF+Tv4jrYGc95ePB0Q0nk1LasRFastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$g9eHRt2pDXV3uFXvmOAWwOFhgXnAw0FrLV2sXx9Ziv04vw+IDlnIfjZPgr51vD5tZuJRbAEs0TYW/0tx8I/R6qJlPh/Z6qMJPVs32Wyj2NqJvnwXK8tt5lvNSNmrP/2SclHRvpu75k1wfR68XnEG8cVcJ6ps3Kr3JPLGINQXQKNqPspNcewMip7DRLeO2lnfhDq7J9icEv2N1AqD9CkWLoHpnNlQm2rDw681ZprRwnUJTn4a2OW3epjATRntxcrzFastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$g9eHRt2pDXV3uFXvmOAWwOFhgXnAw0FrLV2sXx9Ziv04vw+IDlnIfjZPgr51vD5tZuJRbAEs0TYW/0tx8I/R6qJlPh/Z6qMJPVs32Wyj2Nof8V66wPZa5gyvJQtoAYXcwri51UtcD2c00iBgmBrxkw==FastBusiness.Encryption.End&CommandFocusWhenValid;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4WtYW9IrqZqI3ju9IZVQJSk=FastBusiness.Encryption.End">
  


  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrEmployeeProductQuantityInput;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m03$000000" code="a.stt_rec" order="ngay_ct, so_ct" id="L03" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số lượng sản phẩm cá nhân" e="Voucher"></title>
  <partition table="c03$000000" prime="m03$" inquiry="i03$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and (@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and (@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" information="ma_bp$hrbp.ten_bp%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Eknp/YF5HQtSaJtHVmWlfDJQFowS714MKMeuedl/22Y/GjwAmy026tAEkA69ODm1Q==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu" e="Number"></header>
      <items style="Mask"/>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="d03" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="283" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrEmployeeProductQuantityInputDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="status" hidden="true" readOnly="true" clientDefault="1" defaultValue="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" hidden="true" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;

  </fields>

  <views>
    <view id="Dir" height="343" anchor="3" split="6">
      <item value="100, 100, 100, 137, 100, 8, 100, 8, 100, 0"/>
      <item value="1110000001: [ma_bp].Label, [ma_bp], [ten_bp%l], [bp_ref]"/>
      <item value="11------11: [ngay_ct].Label, [ngay_ct], [stt_rec], [ma_nk]"/>
      <item value="11-----111: [so_ct].Label, [so_ct], [status], [ma_dvcs], [cookie]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d03]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;
      </categories>
    </view>

  </views>

  <commands>
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafU3QcWHD7DGTy9QbS15GoatBAFmj7z3DyGe9EATpN5yfIhxWGGdWtvEG53DwwB/EOKt3aaZww1qNKeeLBPibERw=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4lu5GhEr7giApi2+Qp31OWZQ0yly4yvcOCbkO04ZUCfKPztzCsefTfl3rF3Nr2s+By9xOKtdypZOdDjISokXoXIH8JkwmlqAGPPVWsCqY+56yYLrvPyx6k1wQ1MSqXWk2vmc7Q5MOZ+5QgJpqisd99LsFMYoD7qVDtJ8wkcbdM4SOcHim9UQVF2jhNtux1V2VJSVSLR0FaWG27YkfwWsuZaNbN3Tciccl8I+YYIyBMWGRyXA10ZfXviUadBQF3tuKk18pHAUkcNAyAJqqTB53ww70n/OhXBrAYLNEydjeV/6S1nbKo2hjgZI/cQG6wYL5rgu3NI0n1ZUMO/6bCqc6CL7OMFtrsCh7QbrZrMf9fZWnkroE/XYcnWp7PIMDlvHeyZwUEvijZ6poBraUzYmthFMco5FhnDnevDzYP0MBumYONpIfnqMYdH+/+LHggVdx4EahSll3N10wxtqz7AsGpAnVMkJ/BeXil/Q7eTCbUKo+TjS31GB29y/jXXRBbzucJUUSB/ODuqgyHOQE4yXMNCQbzsHbIDHq2wb5EpUFJR3qfb8Ulr8yMjPJrolbGSJ8f23NEZbztgUF5n47j1GArAbvmzi0te8cmJFNIW3zr6mDRSfN5MC3FK5bR+gSI8iaMoRBmPob8EBUiM7oLyQZNZqobKrXJehKrRcgHXNS5GSxZGJKMM+VCQbSYfoguGtdbqOr6t5gOejDcXOErFBnV8LFMjT8nGeI8GYk4Ej6j6w9G7t2j6y7AzvLpSKpxYpPDfLDqRIh0UmdHo6f1NZxxnoD5fBWrQF1YirK+WrrzlFfK2Z/9+gp1szmLK+CIKnUjRV5VqgiYAtZIYlKT3stXUXOMCr4MXtpA8e6p1+FxE</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwT1071WJLZREE3yflUsuPKZPE4WrmYuBFoobfGab6Fv/0a4Kih9h7pKs5qLFIE57oU0iWyXJkNUa0LNhv3009cArLxSwGCvDxTZKfTQh60RII1nHCl8P9wRu5rXSMiDxHD2U5g3f2FYQsSsJRDtKTZa8bE4ZxlpCk3fowliYeKzsA+h9izI13Cb/QV06+NnwsLN5p++H5TEkwHvHwWAIjrHeJSPBKbQ98nQNuQ7U+Uy44N4GO8WNxEZxb/g9t9nWLAlTk+W6NUuEdJUHmvXS3d5x9hty+8NTIkazhOJqb6ZZb5J8J8zSk7fUqkp6FZodcmgKR+/cmYGw+dnnHnR01mYGM5uwQz+2ndKqz1wdA2vSwSagYHrgbJgVjGInJTjps0v4JK6dP0wv4MqvdZwcY3XZyivYjhK0x4DMQrwUqLYXw+WPWEryz54ElJ+gbdueacBD65PdYoyqADnsupJUF3CpjJZjernjqmmHXo06HrxNsgAlMZ5KIT8++3sSQOOzQ==</Encrypted>]]>&CommandCheckValidWhenInsert;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsnROGRWukxA1olcqtEo+1WCxhic9AZB2641sM6kmbr77ttlhXFXyICczrDgE6AK+yQhN/cZFXLGP616sIW3eIi2</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLY3XBseIwh8+fxNLG105wd1SI2L/VSXnotngC8MFf6FAHwWTIqyU2bKs4A+E7vnCqQbqKJl0Eox9xGxxPlOAig=</Encrypted>]]>
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
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwT1071WJLZREE3yflUsuPKZPE4WrmYuBFoobfGab6Fv/0a4Kih9h7pKs5qLFIE57oU0iWyXJkNUa0LNhv3009cArLxSwGCvDxTZKfTQh60RII1nHCl8P9wRu5rXSMiDxHD2U5g3f2FYQsSsJRDtKTZa8bE4ZxlpCk3fowliYeKzsA+h9izI13Cb/QV06+NnwsLN5p++H5TEkwHvHwWAIjrHeJSPBKbQ98nQNuQ7U+Uy44N4GO8WNxEZxb/g9t9nWLAlTk+W6NUuEdJUHmvXS3d5x9hty+8NTIkazhOJqb6ZZb5J8J8zSk7fUqkp6FZodcmgKR+/cmYGw+dnnHnR01mYGM5uwQz+2ndKqz1wdA2vSwSagYHrgbJgVjGInJTjps0v4JK6dP0wv4MqvdZwcY3XZyivYjhK0x4DMQrwUqLYXw+WPWEryz54ElJ+gbdueacBD65PdYoyqADnsupJUF0y0Rv04l4HoOFDq1ThTQmWbmmzjWfeumbp6pfxD2dGQ9Mc+F2Lp/XLf29LiVyuArrYOYMATAnwcyhkOT+B3yQF</Encrypted>]]>&CommandCheckValidWhenUpdate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22cim5es08aIoY4zyaTyqS9yRboCgb5pms2g+4CAbn8UW</Encrypted>]]>&CommandCheckValidWhenInsert;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bSu5B1k9liPyiM8IP13Zu0GNWHmHItPSWrsNCAtYwmK</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aGIq/tl9AJXl2nDyZJ2TSsWfMUh3XieEIYWZcWwILaMyaAQ1j39p/8raGfai6OeVuWf8S4nW2M622ikFBIrFv+/f7aqgNpehoiDYfGlqRqgDYfYvpVnlNiemhlBaUDQrHlP3stjzQdoaTaYnmad4kss5nG6SeCynA/yn9fxT0G67BaEDFUmxZDWMn0GZ0HDZs7ZRCK+s7eeFS0FpONLKOiQlsaisn/+AAeyD9xtaYuumA/wSrdT5YUtN1b1rM6MVkcAsMhWePEyoE8rGj0Lg4/rask15H5DIkLfhiuBYrKvxdgPMqubqZBizBwT4BhJs5hiLc8e5WUjhPL5zKpR4Jg=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RtNO3xbaEouOQL0c/+PW2GjzrsvtYrErnDzGKD26S7UCxJ1Z001ixkBIxCcLWZlFLSbw7/44oU4fZSSD1j2GbOiBZo0aPHpf+AdNlgckRitkL67o6hma3YTweHU92FSVujnoaO6krSsMnNIAtijxtapKRFvHTVHBcJF1diZafuDe+ySgVlzcpHsx3aDtdfD2hxvnoK5/sVqHq+JCv5J7+8Rmkvm4fSAQzkwe2RQNqdZ</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0NvE+TH9K25KD8RMiukXAdDsrUfB/0svBYz6dnsQTchp+jBIsnoh4q48hxjSTFWOZw==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyctttQFkPUSHA8a4RLwhbf4C3dH95u1OGkvOt8Ks7Zl4bXZ98NYYd1FSnp/x69q1Fn5i5cgK+OoKsI1/e8LHLmkz0Dd1Nu5cIHCLQ87ah2DdROGgC8MIz6a4rU0RudXgEdFragvmjnGWghDVT9YTCp85L7OB9+pIgCLlnVylfYhxUn84+nykm1V1GJGll/lT5jMFI6aInv8wQ/tczYgLU2BcSt83i4AWhGyw6aFVb/N27Ei9Nm9mdwbQ3s9ERAvFx6srFmr6Qf/1wWIPPFIwvBK</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTdydH+C0mgpzSC578ny8CnfSa1IxpD6U1KaHDg5H0md/Fi3dDehPb2DB3jqtuiXCOm0ETcH+Rv2fDqY9yuf6kvigfzxIZShSvVQ3KGMG09wPefHBiVD6ivpHVJ9o43x2xYjC9pTAkrvprffxXQYX3lGL3ntAKvv+yJg4N/h9u2A3KIMHbcKvJZo1+FsQQZYt8kYhZdFpoVe6vdR2I0VytgFB2BUAIyZ9uo0vm3Hr1db4REiMmzZLRBuYM1se+Jq4qAio6AFeyuF6tyoEv7AuEALQSivxo7UZPpJuVstNXPxr8rBishvuGjkx8vMJCCOIBk=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezqaE2PC3zLHjMqdxLKJlHFsfpMe3sXRWfx6od4gQE/5/7iYWecRAQ+A5cWnRMgrb9xxHUA8gIv8lVf9dX0rsSomnoH0+xlnj7njXPu22YDtY=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFXWYBKWe2G3b9BVsWJm2NfO2m1gsVittoFgG3ZJPy85RbwQaafXgfSke9YTSLxqGU=</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Zwh3bGXTEXDW/lq385/T4/W6xDb1v/MXU2F3NolZSY6TCDKVzPt7KHojAhjPUueIh91Jm9Q7WjBAowYiuV5Dm26SXqjmyV+3MK8GbU1ssj/B3YwmjYXEC/7+Q9+NwA7vqd+jauq3mLs9q7WM0gLaloLV5/6Mk/0yW99tooHwFHK5zHery4p5U2MUczLvU+Ho9cWTwTFMl9OWk5BdjRSNUABFIjSYhfT9+7p8fVpxmgQ1or+dd7jHE3OBTcbMDGUvkyDzH+is6Uq1WlMdvF8GqfTtXbsFmWbx58c4U7XEfbj</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22f+qeju1WMpdHTyKloCcPObgLzHOCWHZN2tfoMPvbhXO/m6Hcs2oa6szZoFvEE2ASJCuBCPaNuO4zAAuJ4uoyBbq1419b2fpOF+PNRu9qhS0qvA4svIjMq6WMBbJEEULqzkirS9ttl9x1ovLjSi855rVH6PIgdf/cZ0paFs60JzY+ZNf8VhFouJa6u8oxV+B1dj28hLRmV8I/JhP5wplcsuEztDf7gnqTzY1svcngTaNF+RL4OsZx8VgmsAwraXhJxxFSj9eeb1xn1ru6+ABE5TrXAMnM8sCa/e1jDSohbKhViTxIIKNIItm/CCCkj26fg75OhYb9uqIrQUgzAnYrk5pcLGxKBK8zV/NwLvlSzXaBwkOeohONdPGdkCgwxH7ToPP9FpgBN0awED3iquOlYtqEYC3dC1/PP7tyDb539L5P1/xA8MJyFwF//oqHKiTSg==</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4OhCFRfCy1GRSSaAdSJi+cHge8GidPcTUFYh+BLklXj/Zxvj0g2R28PNZronJwlbwBMIDUmAIbcm97sICIQDRHYIpobgdLnpsqbdqmotnciw==</Encrypted>]]>
      </text>
    </action>

    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
    &ListTicket;
  </response>

</dir>