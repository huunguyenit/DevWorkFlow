<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY XMLWhenInitExternalVoucherNumber SYSTEM "..\Include\XML\WhenInitExternalVoucherNumber.xml">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\NoneVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\NoneVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVScHb0r68JzB4bfUvnQ8Rz3/1U0FOeo6XKBb6csgRfI3E+wJKSN21H6somlWnZnMqC70rxuvzA/p2w6Sb3pNEYA+6hvv+/+sxOc3QFykKoCPphTrFECRQUoX0aalUVND1k=FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrWrittenRequest;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="hrphsi01" code="stt_rec" order="ngay_ct, so_ct" id="SI1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="văn bản đề nghị" e="Written Request"></title>
  <partition table="hrphsi01" prime="hrphsi01" inquiry="hrisi01" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số văn bản" e="Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Date Created"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7QxxipynEKp/u+Cjj8pZ5Q+sqSSJZjKM6T55JVypyCZg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="noi_lap">
      <header v="Nơi lập" e="Created at"></header>
    </field>
    <field name="noi_dung">
      <header v="Nội dung" e="Content"></header>
    </field>
    <field name="noi_dung1">
      <header v="" e=""></header>
    </field>
    <field name="ly_do">
      <header v="Lý do" e="Reason"></header>
    </field>
    <field name="ly_do1">
      <header v="" e=""></header>
    </field>

    <field name="dsi" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="259" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrWrittenRequestDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="hs_gk" categoryIndex="2">
      <header v="Hồ sơ gửi kèm" e="Enclosed Document"/>
    </field>
    <field name="hs_gk1" categoryIndex="2">
      <header v="" e=""></header>
    </field>

    <field name="status" hidden="true" defaultValue="1" clientDefault="1" allowContain="true" readOnly="true">
      <header v="" e=""></header>
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
    <view id="Dir" height="319" anchor="9" split="9">
      <item value="100, 100, 21, 100, 8, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0, 0, 0"/>
      <item value="110000000-10-1--11: [noi_lap].Label, [noi_lap], [so_ct].Label, [so_ct], [ma_nk], [ten_nk%l]"/>
      <item value="110000000-10-1---1: [noi_dung].Label, [noi_dung], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="-10000000---------: [noi_dung1]"/>
      <item value="110000000---------: [ly_do].Label, [ly_do]"/>
      <item value="-10000000-----1111: [ly_do1], [ma_dvcs], [cookie], [status], [stt_rec]"/>

      <item value="1: [dsi]"/>

      <item value="110000000---------: [hs_gk].Label, [hs_gk]"/>
      <item value="-10000000---------: [hs_gk1]"/>

      &ListView;
      &PostView;
      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="100, 100, 21, 100, 8, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0, 0, 0" anchor="9">
          <header v="Hồ sơ gửi kèm" e="Enclosed Documents"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3Q4CoEZ57IyDUmPEXtVLpfswCrevdnuM6icrtLWhv09Iu6Q+bpyHYYDPxmBTxr5FPHw8EbAb1EkDWdQQ6PrAjl+mM6hrjyenHf82NvufBahj74K7SMnZUhZBeLkYJfnaxrHXMugO89KFuX0Qadtexyt2ssg079hcQSqg+ygj5ZBbqT71OAo6MWcqFq2lisHMa4qgsGhLU3LDslLRZXa3GGwcFUF3jlT4pLctfRMYA2Ae85rod6c279m9bTbV3q4FQ==</Encrypted>]]>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ioX2dlA71hiUG10e8IUM239+JZQP5HN2LFPKnkQnzziC5Hyz0U2XZdjpFNRx2e2bQTN+nUN9/POu8gnXCQVGNTrbyda/lkxBS3D8BaIb6Oa0T2Pr22pMaLF3syZBg7Rdp</Encrypted>]]><![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    &XMLWhenInitExternalVoucherNumber;

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AslvgqSgWaAySEQyYmBm6XfqRWhmi27dfgO1569YRCu7LTMxHktJNvDZyAa7ez7dewQ6He79herI6CPsOg8zcZwdldreAmEvdMZLvtktS2nsvQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN704zfCxzP207Ib0oDxTTo1aNoa+1bbQ5paLvKtqbVwzB+KrObKF/KSQO36hs1PZg==</Encrypted>]]>&AfterUpdate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
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
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bUfhe9XdXq3PFDdlfXb3ZGgKkAn4WrszWvGIYHBrb+p571HBo/ZoHpElck1yYYCC6gh6QEOox2OhCD8yE3pZcqp3XjcjLwlNKrqhxNikkdpGZnDYmOU7d3VD3nef4LpZY4JdO5tx9ezLk/ep3LAXnwo3zQUrXmLw1G4e2aWBC9CHVz6UTSbpVRpwVjChTeoGuT8DEn2kp8zZHRRFWRhc/joj/5PKCPv+/nP/p2lZan5</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bUfhe9XdXq3PFDdlfXb3ZEISGR6MttsOMVB8jWjEQsKL/2JnP82dnr8jx3A+It2T9NsA494TFx8HTZlPiQ9ppClGQDzDl2AGLQ5OLUQLwJX61B0nh74i1pGJPJs/q558mf8y7bEve3dHcuoZFF67eDvjtJLHWCHe0KX0Psa4vrqJJ9TBWXmntwevtK4bTeWt6pF5bFRR6GRf1qWmD75jm9sQ4rkLmRSqXkKoG9i8XHs</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9qMLeMc/qcKEKiUAEPsCuK+AuK/LxroEyzCyV4SEycZZMDVfO/U3Oo/acycf28h6ediWq00BemjSsPhw1/sL5Q=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzg1CnqAqiGaVcLrReGHQaYwSWIHsoW9DqhCLb4DbcsNqeSSCRn4aKH/aIscaJ0y+XYlD/e5f6acijKBJwWOrdYNoUVAeoOpJ7ozw46uNRKkw+lEoNOPOVoUDhLRxmTgc+FEwJcVhAW7uEtgK5FLTwlk9E1v9vSX4VokpRJo4rPFMn7SjQzKTry5Y1Hy+85ACOAToMMWPwNb5v83YcBhV38pymk5LgTDtzxXnCrDLBfVqDg6qJFVOX8avAKyn8LyJ00nAuvrrvIotKYrRBrFw3gDWZ22tEuy4MS1Tt+WiDD60U3MvJEHXZ0a/b2Tm7yggglseCD/zFMBhRb/7g6tfHuLzzzqtK+wPANmeAxVB3Q/ds5tpB+/N/2F0dJZq8xVOQoL5zbuCVS9pSUv4K5osFtcY6Z9hT41gxVEKNd3YuWX855Fk/cJE+Z1ja8UqtwAdhw3+bq68RJTRYtCFnyMbJ8mZAjXEoL4T9s/nxyl3jHJDTibQBaOMUazzPIzznlX4kGnHW5nR+PChuo9lOWRkx5yxT419TFYxmKc9kJmUXwldrTERiY9+Ab72HnxykNwL2ci1k3urZvcLL+YFG3Mufa</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyctttQFkPUSHA8a4RLwhbf4C3dH95u1OGkvOt8Ks7Zl4bXZ98NYYd1FSnp/x69q1FmR09x9pyrLqQ689n7vg04540gmrPlXeO+XkmbpsEadOmh51rkVtfUjn80uDxCPRlj/Bro7burZZMHaS15a0PZLdzguTCJ/PeC4ucMmI7CPE8THwLERxy6cmxSGC6/fOTzCi2LfETlv4n6fkjHwyGQL30AaNgTOvgUWFxxTrZ7FUvmLa7WNKrHtKsZfKrUQ1Hw=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTdydH+C0mgpzSC578ny8CnfSa1IxpD6U1KaHDg5H0md/Lm1Npmpr6lb0EN8F/Y7DnfYFaIvSIyHSIOdvEGxmbGIk3Hdf1hrBBNtgauMB8uifSfr1B2ksSXmKNfKofWN43xMB0ijllXdGrNTQttyyPdm6KNOZBBPy63m0NdFSTph9ga+kqmBVAp2SMroDGZxZk7PniNIFHhcrjRzCJKf9ewxLD6AwezUekO0AHgYhMniT0jlhTHUeKIt0xE3kxcZcI5P1BLgPYjzhRfXYAOiQaqSnPdNc0dlo3ty/J3gQEORxw==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezwg2s8UduJwwRuHPfS1Fp9LHd/h8LaQlV7Hdr5NB+2r5KzF64brgnnDPEQmh/OCKLDNBwns1g64ZIKxw229O4nlrXyEtD0TCgxkzx96Sc0W4=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFXWYBKWe2G3b9BVsWJm2NfO2m1gsVittoFgG3ZJPy85RbwQaafXgfSke9YTSLxqGU=</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD60AXPp7I9fFGdGn2dfKaXPGI3PMAoBBflROuEDJwFYSTyRcfoCogRI+IH2Tr3K5Ecqs0ZVt5GsZAfhZgt/Ox60rN9cpw+p8Fu4ouT9wORUj6UA1xTCZVZam0ewEXGssO20S8zBAsqo4wHdE9MtzYHoM7QixqX4sIVH5oBp6f7/Pg==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP8tlib1OD4QSA5Sl9Qe01zs=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyvN7YKN2lX7KcyBgs/ok+VkcrNaBthl3yqxBSKbkS0kKDd9xg5HsCRru0vr4lFUyYSMGROhuOCUyaL9nGSOxA2jyYGrnfPaukuD4k25uLKeh57/DVTJ4rWWibGUIFjwt5f5z2INZNJ5iTlX1Dq/Sz2kci+X39cK12SggH4F+9HfyRr9hnD/X8VB+D8FKMuylXw==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>
      &OutlineEntry;
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
    &ListTicket;

  </response>

  &OutlineCss;
</dir>