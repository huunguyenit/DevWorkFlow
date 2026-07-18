<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "hrTMCourseInformationDetailImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="hrdtkh" code="stt_rec" order="ngay_ct, ma_khoa" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0"/>
      <item value="11000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    &UploadCommand;

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+Q+DFCAfaOCNukXyqVH7r2LzAuS4h5pM/64FNRT4Y+e4ZlApqQajNuchB6P7fGPHYYk0UL7QIm1eUU0NYrxALL</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1lNA4DjgBX0LW9i+jVIioSKb+ItrS3ByshTWlC+roCUvZvnqzKrFiGUZOXGPda63j3cvHJDJNPpdsK9bamTBCcO5vuYhtTIEzEdGbsBzvMzeMWYVNVZn66uXiKXUXtFY4KJ4UGQM8lc12S88du1cnzQYaG5gMw639vEvETn7E4Mt5SAhcrhyJqbE4iSpjkupF0B7xKnH9YDa8o0I138aBvErBH/+YMp7w3cdLvCVtWii6LDoXafRpOEPKTuCctqB1aDimvtDsM4XpyIAxZciAVxv3twSGoHZTDlZ8AtstuOFn9jOW3oHYlESY4X3g4UNGHUOGd7nQLID1D1Vtzx2ALKBjNCRCPpCSdSWiWrmguwKELU5UK8DgOqEEniQIMFOm1NG8aEhgTsQ0lfw+lff0TPxBvJQN79a6TENm2BYnpCIHUXc2xOjf8UluBv24EiyAlMzIc+h1BT+RILTf1yETdMIpQnP1PEeNYvx30Zx9V41H/w6ip76II0xafAouFVRVQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv6xgDS+7cETrnfSP7Gi9NyJD2rJKeWzSz1Zb8YnJDvugmwqkH9bvIhjA7je3lTJ/FKEnM28Kn4OyJDjcVfl6oM4w==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uaz7TXHm/iYyTebNi2W05cvtUbLgZI4ok+S3aanT//27PpnV4Y58A/TA/rk7MFPPzYh1c5NwyGtIqERRGcxeL0JkCgAqBNdpR8eQ7iwuFfFmgHgi7M6D3/+vnmrwwBGR59fpKgEgAAsayH/pEpiaTeUrQGfhqS+KnT5mXwx+geU5MXrvEbvQFLKIet+U3HhraYUGgD0HiEqu3q2ORFQme4KSJqpNjNr2GWXoG7Cm+B4omYNCgeIGfSq86tsI4C/J4Ag10gkvi+CxfAvyJ6RjjalKsJD0RirNHyVXgEnPIsM3G+aPv++LQ5EYGTHi5tFi4reF+wsAWLty1/isYfYpsPCunsFRPknNxFsnhC7F20oomdAm5MKrEvEaX/SzR7rOpFKSLxrGtZLQH1Wd6Twq6lGuB1exhNPjjeI+0AVoAOpEe5umyY2tGMGj5xdDoC5ocINirYLK5Q2USAantKO1sT5YeuzJJ8/QV3vsu+lbUjAuXIBcHFo7HNXwEs82XFEBQ9ZF4b0bK9haiq9S/mgMXmmIH1DS7sM4Qsx7APiyk++9jkknyXf4SKpJEAYz0TKMNGlLWHacE2hbDzt264mUKUAmkIgjGhxBgbG4wHrXoSeQRJTe5NZOWNMLIb1SfvLD0VRU0kR7v37ueOb2SSOQOR54LMvSGxIhC4nyRKgXzFAhsZ5il+tgihE9C9CKYydjYmIRClqGmnCED9LfjTF5Mkybce2paXMcrxndz6ryF0w29iC+fDUPJjAciS0MVCdQvePZFLEldgySnInkJU+vOQTxJzOm/48ieA9Vo6QeO+wdqg</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>