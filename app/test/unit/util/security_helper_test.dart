import 'package:basic_utils/basic_utils.dart';
import 'package:localsend_app/util/security_helper.dart';
import 'package:test/test.dart';

void main() {
  group('generateSecurityContext', () {
    // certificate is dependent on time, so we skip this test
    test('should generate a security context', () {
      const modulus =
          '17655370025740741038113156454854199388193503449104440877037318492305460691763108986359629213738068251658702764711191809795804339624629386590749322066892437190139062703234048708020881575102122778994526543290880868262952627726488977960776519938694907994518427540419624537894956809241753063372413058294447378662255052300193831939738828105579615087656442141880311261067266950751778487270744852541404898857201772242498437323791185553734672978477936608290952211534467577849886694581791190994405933665028620559373744808123499229584489594678456882464781972729864955090923226165749030219906764402228914184366893373631422503021';
      const privateExponent =
          '14421008176265737041842552728760854897987189421761902811979258986703749275840685218255600827633436556136869519473805770330945910011841184271318521744401163544644005150782334580299156378790480712915696482733480991790654395453357362699213084041660086971551428119477591606848878236042545176547425781216107887562053872086603693550866169434312772263069345523523039280590638079481520003143359443743141464111595442124530326974852967024986370324441963907065113439224776888067662971143404975436160178871895218249902778285379960904695389191962540588337134680308483675532942364276364403564632886857709821444086544738315317174145';
      const privateP =
          '178524065934350447993678840182944627942309006340524319909851831752106332954026000610471033106817833873729348468467401050633468292518369706764968836071362023882930741070266054692417392199462715540565991951570137107225695543150432250384310373010291328019775467135529294964213555809388513634733256540639643918349';
      const privateQ =
          '98896302486373120089171491460892017227056533661820429564718404666288200233919205658787592871460875274200632466484814562010402123837563042503616158962868253836369412258319855713924996179145010239261725685588005640861685432715579085801665010203646507394652948031357507454692937609788924433344012456182622364129';
      const publicExponent = '65537';

      final keyPair = AsymmetricKeyPair(
        RSAPublicKey(
          BigInt.parse(modulus),
          BigInt.parse(publicExponent),
        ),
        RSAPrivateKey(
          BigInt.parse(modulus),
          BigInt.parse(privateExponent),
          BigInt.parse(privateP),
          BigInt.parse(privateQ),
        ),
      );

      final context = generateSecurityContext(keyPair);
      expect(
        context.privateKey,
        '''-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAi9uDMYRn63SZtEPGRogZGdu5XXBAoQeMO60mycoinqLKDWyZ
dpMo+XWY3wYVhoAyxgzDOcPjIf+Uq1oEy/0K4WwfpbK8SCy851qgYkfMCT9D9mFv
XwWoULJCUHFF7f947ArDE1nmuK1nNx2RodN2wJCXyzPjw0jn06bwGeg0EqfUC8wv
W4FTZ6t1tErzmRqRdMUWuCJwsk1IMbDbFePhiK5jecOBG0RVVWLuw+TkuX8TUgrp
IktH2+qEM1KdLyAMnL71hx2wMvE+lDKFKK9p37zXK8omjl+VgTC8ocjGeYDDsl43
ZtW09V0pb7Vz2FM8b7BgM06kvJl48PIe5puYbQIDAQABAoIBAHI8hAW/TA7j9+Rp
c5wK8M3RTrCGzxN5Ec9w2Hz80ZhYCcg7S4KyI0bYCl0pIA3zywVASXp2iaEsnSf1
aHOipe+JHLSAsRAXEtm6icSdNojbF005OvoXqer4H/iK/X6wLPpItByrUyzH3sYD
LgBLtPUHZiWBpenONCYKdpYCt/3/uyAeC4qj+sBlfN5Fio2A86qIgntg3n6he8Cd
Yq0cjyEGzRnIa9EUDHoHUU30oPPj16LkK0uZxR7H+UKZkYNXQUGtPt0cnAvgS/2f
UnOAIZop1r9NkS7sntg4l9iuDqI4xYMg9wtBStrgLx65nV1l4HDNZGq/LDo3msam
NQoeX4ECgYEA/joJk42iTF3D2IJjFzMf539V9D/1OaXcxmiLMODsIW8ZcyKRRmzD
NIBfMxX/0+X8IgkMwkcnZWOFMWw+2FDgfz2l+PMACJvGEGokxFDiJe68W4KAy8dr
uB0M0ydhRWLG4ZD6U+gvwyqqlMNpEosCH0fJilag+tW/fx6ti2MBYA0CgYEAjNVA
HItnlpnOmzOuyQob9kqE/8eDTSeX5ZFD/OZOypvLPukdg6qWnzaBzUgSJg/Tl9RD
XWE9WgKc2Gpki7/EYvtRW4YwBcoZKBTkAio4t8WBRmLT6L3PUKKdJHOtFbmwlUPw
mfw9HdJG/TgDiTlyAdTbuGhGY/unuUdPMvt2oeECgYEApthqHoeOo3XKKZbw93Hb
F3AvdhxfkVT0ftZvu0VyU0L5veFK3KBWwGcbk4h1nJjMj33G/N370gOtj1EOMaNq
ordP7QF13TB2naE7vgejU+fJgHk2lAauAGg4WX/3y7TW94TRdS3l4r1mtDlHBR9r
5iGT+JGAFv8fLYtxtA/nACUCgYAb6Gpi/bESY/pQQSaiyjEOVmgSs7uuP2lXYbkC
VbVJayQUnGdv3w8oD8obHuwRxNMeZD7RM2LQAnKIZFT2aJMHNlxB8c50Zz8i9TjV
wP4qVKYwh4cMuQhrJz5SqeWjx39ZpPP538VQsonExiPVPp/8Au1jlq5UQ9tR2PK1
3KT+oQKBgQCkmNd8ZHKBoIbG3oV0T4f4IFk8424QD5hQX7Zmb7gxwnCgQScOPBM/
tk4v/rwNoiO9EUW4w4zZZIlvcFJu38+9pPX+rTFxGh6TZ6aRvw7962m2RBmqgYcq
IWwwBbDLI6KuU/iqqvk/1syLDHqeaCdDqTmmyoaKKa7kUhkZkhIlLw==
-----END RSA PRIVATE KEY-----''',
      );

      expect(
        context.publicKey,
        '''-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAi9uDMYRn63SZtEPGRogZ
Gdu5XXBAoQeMO60mycoinqLKDWyZdpMo+XWY3wYVhoAyxgzDOcPjIf+Uq1oEy/0K
4WwfpbK8SCy851qgYkfMCT9D9mFvXwWoULJCUHFF7f947ArDE1nmuK1nNx2RodN2
wJCXyzPjw0jn06bwGeg0EqfUC8wvW4FTZ6t1tErzmRqRdMUWuCJwsk1IMbDbFePh
iK5jecOBG0RVVWLuw+TkuX8TUgrpIktH2+qEM1KdLyAMnL71hx2wMvE+lDKFKK9p
37zXK8omjl+VgTC8ocjGeYDDsl43ZtW09V0pb7Vz2FM8b7BgM06kvJl48PIe5puY
bQIDAQAB
-----END PUBLIC KEY-----''',
      );
    });
  });

  group('calculateHashOfCertificate', () {
    test('should calculate hash of certificate', () {
      const certificate = '''-----BEGIN CERTIFICATE-----
MIIDGTCCAgGgAwIBAgIBATANBgkqhkiG9w0BAQsFADBQMRcwFQYDVQQDEw5Mb2Nh
bFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQLEwAxCTAHBgNVBAcTADEJMAcG
A1UECBMAMQkwBwYDVQQGEwAwHhcNMjMwNDIxMjM0NTM3WhcNMzMwNDE4MjM0NTM3
WjBQMRcwFQYDVQQDEw5Mb2NhbFNlbmQgVXNlcjEJMAcGA1UEChMAMQkwBwYDVQQL
EwAxCTAHBgNVBAcTADEJMAcGA1UECBMAMQkwBwYDVQQGEwAwggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQCL24MxhGfrdJm0Q8ZGiBkZ27ldcEChB4w7rSbJ
yiKeosoNbJl2kyj5dZjfBhWGgDLGDMM5w+Mh/5SrWgTL/QrhbB+lsrxILLznWqBi
R8wJP0P2YW9fBahQskJQcUXt/3jsCsMTWea4rWc3HZGh03bAkJfLM+PDSOfTpvAZ
6DQSp9QLzC9bgVNnq3W0SvOZGpF0xRa4InCyTUgxsNsV4+GIrmN5w4EbRFVVYu7D
5OS5fxNSCukiS0fb6oQzUp0vIAycvvWHHbAy8T6UMoUor2nfvNcryiaOX5WBMLyh
yMZ5gMOyXjdm1bT1XSlvtXPYUzxvsGAzTqS8mXjw8h7mm5htAgMBAAEwDQYJKoZI
hvcNAQELBQADggEBAIs+T8Nkbl0gecT22CKW9/jMvUS1PGAyMqlwP8fNTsyv2xE9
hLsyUrxsscuv+HGJu6Cz1R3hLI8YY5jEShmaelI0stlLahH9Fbm43EZuadGXOVKZ
gMrNzQqLY5lec55rmS17GJlkm5opidkq4OlsCHfrBJitX6071atb0B1cdAjysWwV
x40mnwq0TmYgBLDhWaM4/ZfZQRJQpPCtBJO06Nk7gTPiqJGJU5iEaz1PLvARq69o
bJobSekf9tx3uwOIfioaoQvX0khkZ3ljFuNUpW3IE87OfPnYJQhu5xsTx00wi+Ce
x64ghD4CzRa7wYsOjeb8cUUDMSj030NO9fBGVtA=
-----END CERTIFICATE-----''';

      final hash = calculateHashOfCertificate(certificate);
      expect(hash, '247E5F7CF21DE14438EAE733E07AC5440593D0612570C7413674130608DF69A9');
    });
  });
}
